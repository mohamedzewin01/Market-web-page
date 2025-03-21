import 'package:fadaalhalij/core/di/di.dart';
import 'package:fadaalhalij/core/resources/color_manager.dart';
import 'package:fadaalhalij/core/resources/style_manager.dart';
import 'package:fadaalhalij/features/products/presentation/widgets/skeleton_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/StoreModelResponse.dart';
import '../manager/products_cubit.dart';
import '../widgets/app_bar_body.dart';
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
                  List<BestDeals>? productsList = state
                      .productModelEntity.data?.products?.bestDeals?.reversed
                      .toList();
                  return Column(
                    children: [
                      Expanded(
                        child: NestedScrollView(
                            headerSliverBuilder: (context, innerBoxIsScrolled) {
                              return [
                                AppBarBody(
                                  store: state.productModelEntity.data?.store,
                                ),
                              ];
                            },
                            body: RefreshIndicator(
                              color: ColorManager.error,
                              backgroundColor: ColorManager.white,
                              onRefresh: () {
                                return viewModel.getProductsData();
                              },
                              child: HomeBody(
                                productsList: productsList ?? [],
                              ),
                            )),
                      ),
                      Center(
                          child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                color: ColorManager.primaryColor,
                                child: Center(
                                    child: Text(
                                  maxLines: 1,
                                  textDirection: TextDirection.rtl,
                                  overflow: TextOverflow.ellipsis,
                                  state.productModelEntity.data?.store
                                          ?.storeDiscountTitle ??
                                      '',
                                  style:
                                      getBoldStyle(color: ColorManager.black),
                                ))),
                          ),
                        ],
                      ))
                    ],
                  );
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'فضاء الخليج ترحب بكم',
                        style: getSemiBoldStyle(color: ColorManager.primary),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CircularProgressIndicator(
                        color: ColorManager.primaryColor,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
