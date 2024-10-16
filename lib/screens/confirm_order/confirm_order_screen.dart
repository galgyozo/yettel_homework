import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yettel_homework/models/county/county_model.dart';
import 'package:yettel_homework/models/vehicle/vehicle_category_model.dart';
import 'package:yettel_homework/models/vehicle/vehicle_info_model.dart';
import 'package:yettel_homework/models/vignette/vignette_model.dart';
import 'package:yettel_homework/screens/confirm_order/cubit/confirm_order_cubit.dart';
import 'package:yettel_homework/screens/confirm_order/cubit/confirm_order_state.dart';
import 'package:yettel_homework/theme/colors.dart';
import 'package:yettel_homework/utils/navigation/router.gr.dart';
import 'package:yettel_homework/utils/price_formatter.dart';
import 'package:yettel_homework/widgets/app_bar.dart';
import 'package:yettel_homework/widgets/button.dart';
import 'package:yettel_homework/widgets/error_dialog.dart';
import 'package:yettel_homework/widgets/loading_dialog.dart';

enum ContentRowTitleType { small, medium, large }

extension ContentRowTitleTypeExtension on ContentRowTitleType {
  TextStyle? textStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return switch (this) {
      ContentRowTitleType.small => textTheme.bodyMedium,
      ContentRowTitleType.medium => textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ContentRowTitleType.large => textTheme.headlineSmall,
    };
  }
}

const systemUsePrice = 110.0;

@RoutePage()
class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({
    super.key,
    required this.vehicleInfo,
    required this.vehicleCategories,
    required this.vignette,
    this.counties = const [],
  });

  final VehicleInfo vehicleInfo;
  final List<VehicleCategory> vehicleCategories;
  final Vignette vignette;
  final List<County> counties;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmOrderCubit(),
      child: Scaffold(
        backgroundColor: whiteBackgroundColor,
        appBar: const RoundedAppBar(
          title: 'E-matrica',
        ),
        body: BlocConsumer<ConfirmOrderCubit, ConfirmOrderState>(
            listener: (context, state) {
          if (state is ConfirmOrderInitial) {
            // To remove the loading dialog
            context.router.popForced();
          } else if (state is ConfirmOrderSuccess) {
            context.router.replace(const ConfirmOrderSuccessRoute());
          } else if (state is ConfirmOrderLoading) {
            showLoadingDialog(context);
          } else if (state is ConfirmOrderError) {
            showErrorDialog(
              context: context,
              message: state.error,
              onClose: context.read<ConfirmOrderCubit>().resetState,
            );
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _orderSummary(context),
                  const SizedBox(height: 32),
                  _bottomButtons(context),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _orderSummary(BuildContext context) {
    final sum = vignette.sum * (counties.isEmpty ? 1 : counties.length);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Vásárlás megerősítése',
                style: textTheme.headlineMedium,
              ),
              const Divider(color: lightGreyColor),
              const SizedBox(height: 17),
              _contentRow(
                context,
                ContentRowTitleType.small,
                'Rendszám',
                vehicleInfo.plate.toUpperCase().replaceAll('-', ' '),
              ),
              const SizedBox(height: 16),
              _contentRow(
                context,
                ContentRowTitleType.small,
                'Matrica típusa',
                counties.isEmpty
                    ? vignette.name(vehicleCategories)
                    : 'Éves vármegyei',
              ),
              const SizedBox(height: 17),
              const Divider(color: lightGreyColor, height: 0),
              const SizedBox(height: 32),
              if (counties.isEmpty) ...[
                _contentRow(
                  context,
                  ContentRowTitleType.large,
                  'Országos',
                  formatPrice(vignette.sum),
                ),
                const SizedBox(height: 12),
              ] else
                ...counties.map(
                  (county) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _contentRow(
                      context,
                      ContentRowTitleType.large,
                      county.name,
                      formatPrice(vignette.sum),
                    ),
                  ),
                ),
              _contentRow(
                context,
                ContentRowTitleType.medium,
                'Rendszerhasználati díj',
                formatPrice(systemUsePrice),
              ),
            ],
          ),
        ),
        const Divider(color: lightGreyColor, height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Fizetendő összesen',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                formatPrice(sum),
                style: textTheme.headlineSmall?.copyWith(fontSize: 40),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contentRow(
    BuildContext context,
    ContentRowTitleType titleType,
    String title,
    String value,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        // Used expanded instead of setting the mainAxisAlignment to avoid
        // overflow in case of long text / small screen
        Expanded(
          child: Text(
            title,
            style: titleType.textStyle(context),
          ),
        ),
        Text(
          value,
          style: textTheme.bodyMedium,
        )
      ],
    );
  }

  Widget _bottomButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PrimaryButton(
          text: 'Tovább',
          onPressed: () => context.read<ConfirmOrderCubit>().postOrder(
                vignette,
                counties,
              ),
        ),
        const SizedBox(height: 16),
        SecondaryButton(
          text: 'Mégsem',
          onPressed: context.router.popForced,
        ),
      ],
    );
  }
}
