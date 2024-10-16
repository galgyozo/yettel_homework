import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yettel_homework/models/vehicle/vehicle_info_model.dart';
import 'package:yettel_homework/models/vignette/vignette_api_response_model.dart';
import 'package:yettel_homework/models/vignette/vignette_model.dart';
import 'package:yettel_homework/screens/vignettes/cubit/vignettes_cubit.dart';
import 'package:yettel_homework/screens/vignettes/cubit/vignettes_state.dart';
import 'package:yettel_homework/theme/colors.dart';
import 'package:yettel_homework/utils/navigation/router.gr.dart';
import 'package:yettel_homework/utils/price_formatter.dart';
import 'package:yettel_homework/widgets/app_bar.dart';
import 'package:yettel_homework/widgets/button.dart';
import 'package:yettel_homework/widgets/error_dialog.dart';
import 'package:yettel_homework/widgets/menu_item.dart';
import 'package:yettel_homework/widgets/radio_button.dart';
import 'package:yettel_homework/widgets/rounded_card.dart';

@RoutePage()
class VignettesScreen extends StatelessWidget {
  const VignettesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VignettesCubit()..fetchHighwayVignetteInfo(),
      child: Scaffold(
        backgroundColor: greyBackgroundColor,
        appBar: const RoundedAppBar(title: 'E-matrica'),
        body: BlocConsumer<VignettesCubit, VignettesState>(
          listener: (context, state) {
            if (state is VignettesInitial) {
              // To remove the loading dialog
              context.router.popForced();
            } else if (state is VignettesError) {
              showErrorDialog(
                context: context,
                message: state.error,
                onClose: context.read<VignettesCubit>().resetState,
              );
            }
          },
          builder: (context, state) {
            if (state is VignettesLoading) {
              return const Center(
                child: CircularProgressIndicator(color: limePrimaryColor),
              );
            } else if (state is VignettesLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _userData(context, state.vehicleInfo),
                      const SizedBox(height: 16),
                      _countryVignettes(
                        context,
                        state.highwayVignetteInfo,
                        state.selectedVignette,
                        context.read<VignettesCubit>().selectItem,
                        state.vehicleInfo,
                      ),
                      const SizedBox(height: 16),
                      _countyVignettes(
                        context,
                        state.vehicleInfo,
                        state.highwayVignetteInfo,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: Text('Nincsenek elérhető matricák'));
          },
        ),
      ),
    );
  }

  Widget _userData(
    BuildContext context,
    VehicleInfo vehicleInfo,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return RoundedCard(
      radius: 8,
      child: Row(
        children: [
          // Here we could show different images based on the type
          SvgPicture.asset('assets/images/car.svg'),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vehicleInfo.plate.toUpperCase().replaceAll('-', ' '),
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 4),
              Text(vehicleInfo.name, style: textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }

  Widget _countryVignettes(
    BuildContext context,
    HighwayVignetteInfo vignetteInfo,
    Vignette? selectedVignette,
    Function(Vignette? vignette) onSelect,
    VehicleInfo vehicleInfo,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return RoundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Országos matricák', style: textTheme.headlineMedium),
          const SizedBox(height: 15),
          ...vignetteInfo.highwayVignettes
              .where((vignette) => vignette.vignetteType.length == 1)
              .map(
            (vignette) {
              final isSelected = vignette == selectedVignette;

              return GestureDetector(
                onTap: () => onSelect(isSelected ? null : vignette),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: isSelected ? navyPrimaryColor : lightGreyColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      RadioButton(selected: isSelected),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          vignette.name(
                            vignetteInfo.vehicleCategories,
                          ),
                          style: textTheme.bodyLarge,
                        ),
                      ),
                      Text(
                        formatPrice(vignette.sum),
                        style: textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          PrimaryButton(
            text: 'Vásárlás',
            onPressed: selectedVignette == null
                ? null
                : () => context.router.push(
                      ConfirmOrderRoute(
                        vehicleInfo: vehicleInfo,
                        vignette: selectedVignette,
                        vehicleCategories: vignetteInfo.vehicleCategories,
                      ),
                    ),
          ),
        ],
      ),
    );
  }

  Widget _countyVignettes(
    BuildContext context,
    VehicleInfo vehicleInfo,
    HighwayVignetteInfo highwayVignetteInfo,
  ) {
    final countyVignette = highwayVignetteInfo.highwayVignettes.firstWhere(
      (vignette) => vignette.vignetteType.length > 1,
    );

    return MenuItem(
      title: 'Éves vármegyei matricák',
      onTap: () => context.router.push(
        CountyVignettesRoute(
          vehicleInfo: vehicleInfo,
          vignette: countyVignette,
          counties: highwayVignetteInfo.counties,
          vehicleCategories: highwayVignetteInfo.vehicleCategories,
        ),
      ),
    );
  }
}
