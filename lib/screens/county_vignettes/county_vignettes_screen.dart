import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yettel_homework/models/county/county_model.dart';
import 'package:yettel_homework/models/vehicle/vehicle_category_model.dart';
import 'package:yettel_homework/models/vehicle/vehicle_info_model.dart';
import 'package:yettel_homework/models/vignette/vignette_model.dart';
import 'package:yettel_homework/theme/colors.dart';
import 'package:yettel_homework/utils/navigation/router.gr.dart';
import 'package:yettel_homework/utils/price_formatter.dart';
import 'package:yettel_homework/widgets/app_bar.dart';
import 'package:yettel_homework/widgets/button.dart';
import 'package:yettel_homework/widgets/rounded_card.dart';
import 'package:yettel_homework/widgets/rounded_checkbox.dart';

@RoutePage()
class CountyVignettesScreen extends StatefulWidget {
  const CountyVignettesScreen({
    super.key,
    required this.vehicleInfo,
    required this.vehicleCategories,
    required this.counties,
    required this.vignette,
  });

  final VehicleInfo vehicleInfo;
  final List<VehicleCategory> vehicleCategories;
  final List<County> counties;
  final Vignette vignette;

  @override
  State<CountyVignettesScreen> createState() => _CountyVignettesScreenState();
}

class _CountyVignettesScreenState extends State<CountyVignettesScreen> {
  // Could be handled with a bloc, more boilerplate code.
  // I used StatefulWidget since this is only a UI state
  final List<County> _selectedCounties = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: whiteBackgroundColor,
      appBar: const RoundedAppBar(title: 'E-matrica'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Éves vármegyei matricák',
                      style: textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 24),
                    SvgPicture.asset('assets/images/hungary.svg'),
                    const SizedBox(height: 24),
                    _vignetteWarning(context),
                    _vignetteList(context),
                    const Divider(
                      color: lightGreyColor,
                      height: 24,
                    ),
                    _summary(context),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              PrimaryButton(
                text: 'Tovább',
                onPressed: _selectedCounties.isEmpty
                    ? null
                    : () => context.router.push(
                          ConfirmOrderRoute(
                            vehicleInfo: widget.vehicleInfo,
                            vignette: widget.vignette,
                            counties: _selectedCounties,
                            vehicleCategories: widget.vehicleCategories,
                          ),
                        ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _vignetteWarning(BuildContext context) {
    List counties = [];

    _selectedCounties.sort((a, b) {
      int aNumber = int.parse(a.id.split('_')[1]);
      int bNumber = int.parse(b.id.split('_')[1]);
      return aNumber.compareTo(bNumber);
    });

    for (int i = 0; i < _selectedCounties.length - 1; i++) {
      int currentNumber = int.parse(_selectedCounties[i].id.split('_').last);
      int nextNumber = int.parse(_selectedCounties[i + 1].id.split('_').last);

      if (nextNumber - currentNumber != 1) {
        counties.add(_selectedCounties[i].name);
      }
    }

    if (counties.isEmpty) {
      return const SizedBox.shrink();
    }

    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        RoundedCard(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 16),
          radius: 8,
          color: warningBackgroundColor,
          child: Row(
            children: [
              SvgPicture.asset('assets/images/info.svg'),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  'Ellenőrizd a kijelölt megyéket mert nem érnek össze!\n(${counties.join(', ')})',
                  style: textTheme.bodyLarge,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 26,
        )
      ],
    );
  }

  Widget _vignetteList(BuildContext context) {
    return Column(
      children: widget.counties
          .map(
            (county) => _countyRow(context, county),
          )
          .toList(),
    );
  }

  Widget _countyRow(BuildContext context, County county) {
    final textTheme = Theme.of(context).textTheme;
    final isSelected = _selectedCounties.contains(county);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () => _selectCounty(county),
        child: Row(
          children: [
            RoundedCheckbox(selected: isSelected),
            const SizedBox(width: 12),
            Text(
              county.name,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
                color: isSelected ? darkGreyColor : null,
              ),
            ),
            const Spacer(),
            Text(
              formatPrice(widget.vignette.sum),
              style: textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _summary(BuildContext context) {
    final sum = _selectedCounties.length * widget.vignette.sum;
    final textTheme = Theme.of(context).textTheme;
    return Column(
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
    );
  }

  void _selectCounty(County county) {
    setState(() {
      if (_selectedCounties.contains(county)) {
        _selectedCounties.remove(county);
      } else {
        _selectedCounties.add(county);
      }
    });
  }
}
