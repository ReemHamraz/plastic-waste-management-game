import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'infocean_viewmodel.dart';

class InfoceanView extends StackedView<InfoceanViewModel> {
  const InfoceanView({super.key});

  @override
  Widget builder(
    BuildContext context,
    InfoceanViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/screens-backgrounds/home.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(label: 'Garbage', icon: Image.asset('assets/images/garbages/soda_can.png', height: 35)),
              NavigationDestination(label: 'Animals', icon: Image.asset('assets/images/animals/clown_fish.png', height: 35)),
            ],
            selectedIndex: viewModel.currentIndex,
            onDestinationSelected: viewModel.setIndex,
          ),
          appBar: AppBar(
            title: const Text('Infocean'),
          ),
          body: GridView.count(
            primary: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: max(1, (quarterScreenWidth(context) * 2 ~/ 200).toInt()),
            padding: getResponsivePadding(context),
            children: List.generate(
              viewModel.source.length,
              (index) => _buildCard(context, viewModel, index),
            ),
          ),
        ),
      ],
    );
  }

  @override
  InfoceanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InfoceanViewModel();

  _buildCard(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Card(
      color: Colors.white.withOpacity(0.7),
      child: Stack(
        children: [
          _buildImage(context, viewModel, index),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName(context, viewModel, index),
                verticalSpaceSmall,
                _buildLifeLong(context, viewModel, index),
                verticalSpaceMedium,
                Expanded(
                  child: Text(
                    viewModel.diveDepthLevel >= viewModel.source[index].requiredLevel ? viewModel.source[index].description : "???",
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Positioned(
      bottom: -20,
      right: -20,
      child: Transform.flip(
        flipX: viewModel.source[index].shouldFlip,
        child: Transform.rotate(
          angle: 75,
          child: Image.asset(
            viewModel.source[index].imagePath,
            height: 100,
            width: 100,
            color: viewModel.diveDepthLevel >= viewModel.source[index].requiredLevel ? null : Colors.grey,
            // colorBlendMode: BlendMode.saturation,
          ),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Text(
      viewModel.diveDepthLevel >= viewModel.source[index].requiredLevel ? viewModel.source[index].name : "???",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _buildLifeLong(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Chip(
      label: Text(viewModel.diveDepthLevel >= viewModel.source[index].requiredLevel ? viewModel.source[index].lifeLong : "???"),
    );
  }
}
