import 'package:flutter/material.dart';
import 'package:frontend_idemusistemsinergi/website/controller/product_controller.dart';
import 'package:frontend_idemusistemsinergi/website/widget/product_card.dart';
import 'package:get/get.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({super.key});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final products = productController.product;
    final pageCount = (products.length / 3).ceil();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'FEATURED PRODUCTS',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: pageCount,
                  itemBuilder: (context, pageIndex) {
                    final startIndex = pageIndex * 3;
                    final endIndex = (startIndex + 3) > products.length
                        ? products.length
                        : startIndex + 3;
                    final pageProducts = products.sublist(startIndex, endIndex);

                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _currentPage == pageIndex ? 1.0 : 0.7,
                      child: Transform.scale(
                        scale: _currentPage == pageIndex ? 1.0 : 0.9,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              
                              final cardWidth = (constraints.maxWidth - (2 * 48)) / 3;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(
                                    pageProducts.length,
                                    (index) => Container(
                                      width: cardWidth,
                                      padding: const EdgeInsets.symmetric(horizontal: 24),
                                      child: ProductCard(
                                        gambar: pageProducts[index].gambar,
                                        title: pageProducts[index].title,
                                        subtitle: pageProducts[index].subTitle,
                                        harga: pageProducts[index].harga.toString(),
                                      ),
                                    ),
                                  ),
                                  
                                  if (pageProducts.length < 3)
                                    ...List.generate(
                                      3 - pageProducts.length,
                                      (index) => SizedBox(width: cardWidth),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
                
                if (_currentPage > 0)
                  Positioned(
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOutCubic,
                          );
                        },
                      ),
                    ),
                  ),
                if (_currentPage < pageCount - 1)
                  Positioned(
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOutCubic,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pageCount,
              (index) => GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutCubic,
                  );
                },
                child: Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.blue
                        : Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}