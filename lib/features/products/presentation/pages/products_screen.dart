import 'package:fadaalhalij/core/di/di.dart';
import 'package:fadaalhalij/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductsSuccess) {
                  return HomeBody(
                    productsList: state.productModelEntity.products ?? [],
                  );
                }
                return Text('zzzzz');
              },
            ),
          ),
        ),
      ),
    );
  }
}
