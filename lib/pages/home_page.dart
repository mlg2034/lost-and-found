import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamyrlan/domain/model/post.dart';
import 'package:tamyrlan/pages/profile_page.dart';

import '../bloc/feed/feed_bloc.dart';
import '../domain/repository/post_repository.dart';
import '../widgets/text_field_widget/custom_search_text_fied.dart';
import 'product_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBloc(context.read<PostRepository>()),
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeView> {
  bool _isFocused = false;
  late FeedBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<FeedBloc>();
    if (!_isFocused) {
      _bloc.add(GetPosts());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedContainer(
          duration: const Duration(microseconds: 100),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 63),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          _isFocused = true;
                        });
                      },
                      child: CustomSearchTextField(
                        textHint: 'S e a r c h . . .',
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 18,
                    width: 118,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: Color.fromRGBO(100, 93, 215, 1)),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Astana',
                          style: TextStyle(
                              color: const Color.fromRGBO(100, 93, 215, 1),
                              fontSize: 12,
                              fontFamily: 'Bitter',
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  BlocBuilder<FeedBloc, FeedState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case FeedStatus.initial:
                          return Container();
                        case FeedStatus.inProgress:
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        case FeedStatus.failure:
                          return Center(
                            child: Text(
                              state.failureMessage ?? "Something went wrong",
                            ),
                          );
                        case FeedStatus.successful:
                          return GridView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 10.0),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 158.5 / 191,
                            ),
                            shrinkWrap: true,
                            children: _getPosts(state),
                          );
                      }
                    },
                  ),

                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  List<Widget> _getPosts(FeedState state) {
    List<Container> items = [];
    for (Post post in state.posts!) {
      items.add(Container(
        height: 236,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 115,
              width: 180,
              child: InkWell(
                onTap: () async {
                  await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ProductView()));
                },
                child: Image.network(post.photo ?? ""),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title!,
                    style: const TextStyle(
                        fontFamily: 'Bitter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    post.description ?? "",
                    style: const TextStyle(
                        fontFamily: 'Bitter',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      post.date ?? "",
                      style: const TextStyle(
                          fontFamily: 'Bitter',
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(135, 131, 131, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),);
    }
    return items;
  }
}
