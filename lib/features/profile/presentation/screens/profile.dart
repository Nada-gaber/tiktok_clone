import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_cubit.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_state.dart';
import '../widgets/profile_insights_details_row.dart';
import '../widgets/tab_bar_views_profile.dart';
import 'edit_profile.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        print('BlocBuilder rebuilding with state: $state'); // Debug state changes
        return state.maybeWhen(
          authenticated: (user) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Profile'),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                    },
                  ),
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: user.photoURL != null &&
                                user.photoURL!.isNotEmpty
                            ? NetworkImage(
                                '${user.photoURL!}?t=${DateTime.now().millisecondsSinceEpoch}')
                            : const NetworkImage(
                                'https://static.vecteezy.com/system/resources/thumbnails/036/280/650/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '@${user.displayName}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          final updatedUser = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditProfileScreen(user: user),
                            ),
                          );
                          if (updatedUser != null && context.mounted) {
                            context.read<AuthCubit>().checkAuth();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          minimumSize: const Size(200, 40),
                        ),
                        child: const Text('Edit Profile'),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileInsightsDetailsRow(
                              digits: '100', title: 'following'),
                          SizedBox(width: 30),
                          ProfileInsightsDetailsRow(
                              digits: '200', title: 'followers'),
                          SizedBox(width: 30),
                          ProfileInsightsDetailsRow(
                              digits: '300', title: 'likes'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TabBar(
                        controller: _tabController,
                        tabs: const [
                          Tab(icon: Icon(Icons.grid_on)),
                          Tab(icon: Icon(Icons.lock_outline)),
                          Tab(icon: Icon(Icons.bookmark_border)),
                          Tab(icon: Icon(Icons.favorite_border)),
                        ],
                      ),
                      SizedBox(
                          height: 400,
                          child: TabBarViewProfileTabs(
                              tabController: _tabController)),
                    ],
                  ),
                ),
              ),
            );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}