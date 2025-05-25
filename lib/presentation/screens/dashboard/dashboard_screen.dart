import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khazana/presentation/screens/authentication/authentication_screen.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../../core/index.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../cubits/charts/charts_cubit.dart';
import 'charts/charts_page_widget.dart';
import 'home/home_page_widget.dart';
import 'watchlist/watchlist_page_widget.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = '/dashboard';
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      HomeScreen(toggleDrawer: toggleDrawer),
      ChartsScreen(
        backCallback: () {
          setState(() => _selectedIndex = 0);
        },
      ),
      WatchlistScreen(
        onTapMFFund: () {
          setState(() => _selectedIndex = 1);
        },
      ),
    ];
    super.initState();
  }

  void toggleDrawer() {
    if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      _scaffoldKey.currentState?.closeEndDrawer();
    } else {
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          Navigator.pushNamedAndRemoveUntil(context, AuthenticationScreen.route, (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          body: Padding(padding: const EdgeInsets.only(top: 56), child: IndexedStack(index: _selectedIndex, children: screens)),
          endDrawer: Drawer(
            child: SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 150, left: 30, right: 30),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _scaffoldKey.currentState?.closeEndDrawer();
                      context.read<AuthCubit>().logout();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged out')));
                    },
                    icon: Icon(Icons.logout, color: Theme.of(context).primaryColor),
                    label: Text('Logout', style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).primaryColor)),
                    style: OutlinedButton.styleFrom(minimumSize: Size(double.infinity, 48), side: BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(top: BorderSide(color: Theme.of(context).colorScheme.onSecondary, width: .1)),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
              selectedItemColor: Theme.of(context).primaryColor,
              selectedLabelStyle: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).primaryColor),
              unselectedLabelStyle: TextStyles.textStyle_12_400,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                if (_selectedIndex == 1) {
                  context.read<ChartsCubit>().fetchFund('100119');
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      AppConstants.homeIcon,
                      width: 25,
                      height: 25,
                      color: _selectedIndex == 0 ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      AppConstants.chartIcon,
                      width: 25,
                      height: 25,
                      color: _selectedIndex == 1 ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  label: 'Charts',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      AppConstants.watchlistIcon,
                      width: 25,
                      height: 25,
                      color: _selectedIndex == 2 ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  label: 'Watchlist',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
