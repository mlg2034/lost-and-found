import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tamyrlan/bloc/post/post_bloc.dart';
import 'package:tamyrlan/domain/repository/post_repository.dart';
import 'package:tamyrlan/pages/map_page.dart';
import 'package:tamyrlan/domain/model/post.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';

class PostPage extends StatelessWidget {
  final int postId;

  const PostPage(this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(context.read<PostRepository>()),
      child: PostView(postId),
    );
  }
}

class PostView extends StatefulWidget {
  final int postId;

  const PostView(this.postId, {super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late PostBloc _bloc;
  late MapController _mapController;

  @override
  void initState() {
    _mapController = MapController();
    _bloc = context.read<PostBloc>();
    _bloc.add(GetPost(widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<PostBloc, PostState>(builder: (context, state) {
              switch (state.status) {
                case PostStatus.initial:
                  return Container();
                case PostStatus.inProgress:
                  return const CupertinoActivityIndicator();
                case PostStatus.failure:
                  return Text(state.failureMessage ?? "");
                case PostStatus.successful:
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 59),
                        child: SizedBox(
                          height: 222,
                          width: 414,
                          child: Image.network(state.post!.photo!),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 65,
                            horizontal: 3,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SizedBox(
                              height: 35,
                              width: 35,
                              child: Image.network(state.post!.photo!),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 299,
                          horizontal: 21,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.post!.title!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Bitter',
                                  ),
                                ),
                                Text(
                                  state.post!.date!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Inter',
                                    color: Color.fromRGBO(0, 0, 0, 0.7),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Color.fromRGBO(100, 93, 215, 1),
                              thickness: 2.0,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'D e s c r i p t i o n',
                                style: TextStyle(
                                  fontFamily: 'Bitter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              state.post!.description!,
                              style: const TextStyle(
                                fontFamily: 'Bitter',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 91,
                            ),
                            const Divider(
                              color: Color.fromRGBO(100, 93, 215, 1),
                              thickness: 2.0,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Location',
                                style: TextStyle(
                                  fontFamily: 'Bitter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30,
                                        left: 15,
                                        right: 15,
                                      ),
                                      child:
                                          Image.asset('assets/images/pin.png'),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const Text(
                                      'Astana',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const MapPage(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 76,
                                    width: 260,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: IgnorePointer(
                                        child: FlutterMap(
                                          options: MapOptions(
                                            center: LatLng(
                                                state.post!.latitude!,
                                                state.post!.longitude!),
                                            zoom: 12,
                                            minZoom: 2,
                                          ),
                                          mapController: _mapController,
                                          layers: [
                                            TileLayerOptions(
                                              urlTemplate:
                                                  "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
                                              additionalOptions: {
                                                'accessToken':
                                                "pk.eyJ1IjoibG9jYTIwIiwiYSI6ImNsZW1mNW8zNjAzMmszcW41eHF0Znh4bmYifQ.FA8EaKIF8Yk7XIyruTNndw",
                                                // 'id': Constants.mapboxStyle,
                                              },
                                              backgroundColor: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Color.fromRGBO(100, 93, 215, 1),
                              thickness: 2.0,
                            ),
                            const Text(
                              'USER',
                              style: TextStyle(
                                fontFamily: 'Bitter',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 43.5,
                                  backgroundImage:
                                      NetworkImage(state.post!.user!.avatar!),
                                ),
                                const SizedBox(
                                  width: 29,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.post!.name!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Bitter',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      state.post!.email!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Bitter',
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromRGBO(135, 131, 131, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    SizedBox(
                                      width: 91,
                                      height: 21,
                                      child: OutlinedButton(
                                        style: ButtonStyle(
                                          side: MaterialStateProperty.all<
                                              BorderSide>(
                                            const BorderSide(
                                              color: Color.fromRGBO(
                                                67,
                                                197,
                                                158,
                                                1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          launchUrl(Uri.parse(
                                              "tel://${state.post!.phone!}"));
                                        },
                                        child: const Text(
                                          'Call',
                                          style: TextStyle(
                                            fontFamily: 'Bitter',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(67, 197, 158, 1),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
              }
            }),
          ],
        ),
      ),
    );
  }
}
