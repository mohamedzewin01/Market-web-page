import 'package:fadaalhalij/core/di/di.dart';
import 'package:fadaalhalij/core/resources/color_manager.dart';
import 'package:fadaalhalij/core/resources/style_manager.dart';
import 'package:fadaalhalij/features/products/presentation/widgets/skeleton_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../manager/products_cubit.dart';
import '../widgets/product_home.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductsCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProductsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return viewModel.getProductsData();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.white,
          body: BlocProvider(
            create: (context) => viewModel..getProductsData(),
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const SkeletonHome();
                }
                if (state is ProductsSuccess) {
                  return Column(
                    children: [
                      Expanded(
                        child: NestedScrollView(
                            headerSliverBuilder: (context, innerBoxIsScrolled) {
                              return [
                                SliverAppBar(
                                    backgroundColor: ColorManager.white,
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 30),
                                      child: Text(
                                        'فضاء الخليج',
                                        style: GoogleFonts.harmattan(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.white),
                                      ),
                                    ),
                                    expandedHeight: 200,
                                    flexibleSpace: FlexibleSpaceBar(
                                      centerTitle: true,
                                      background: Image.asset(
                                        'assets/images/delivery-goods-blue-surface.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ];
                            },
                            body: HomeBody(
                              productsList:
                                  state.productModelEntity.products ?? [],
                            )),
                      ),
                      Center(
                          child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                color: ColorManager.yellow,
                                child: Center(
                                    child: Text(
                                  'تموينات فضاء الخيلج - الارطاوية ',
                                  style:
                                      getBoldStyle(color: ColorManager.error),
                                ))),
                          ),
                        ],
                      ))
                    ],
                  );
                }
                return Center(child: Text('error'));
              },
            ),
          ),
        ),
      ),
    );
  }
}
