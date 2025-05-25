import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khazana/presentation/widgets/custom_textfield.dart';
import 'package:khazana/presentation/widgets/index.dart';

import '../../../../../core/index.dart';
import '../../../../../cubits/watchlist/watchlist_cubit.dart';

class FloatingWatchlistButton extends StatelessWidget {
  const FloatingWatchlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showWatchlistBottomSheet(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary, size: 18),
            const SizedBox(width: 6),
            Text("Watchlist", style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }

  void _showWatchlistBottomSheet(BuildContext context) async {
    final watchlists = await context.read<WatchlistCubit>().getAllWatchlistNames();

    if (context.mounted) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (ctx) => WatchlistSelectorBottomSheet(watchlists: watchlists),
      );
    }
  }
}

class WatchlistSelectorBottomSheet extends StatelessWidget {
  final List<String> watchlists;

  const WatchlistSelectorBottomSheet({super.key, required this.watchlists});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 8),
              Text("All Watchlist", style: TextStyles.textStyle_16_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
              IconButton(icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onPrimary), onPressed: () => Navigator.pop(context)),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0), child: Divider(thickness: .3, color: Theme.of(context).colorScheme.onSecondary)),
          ...watchlists.map(
            (watchlist) => ListTile(
              title: Text(watchlist),
              trailing: Icon(Icons.edit, size: 18, color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add_circle, color: Theme.of(context).primaryColor), SizedBox(width: 8), Text("Create a new watchlist")],
            ),
            onTap: () {
              Navigator.pop(context);
              _showCreateWatchlistSheet(context);
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  void _showCreateWatchlistSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) => const CreateWatchlistSheet(),
    );
  }
}

class CreateWatchlistSheet extends StatefulWidget {
  const CreateWatchlistSheet({super.key});

  @override
  State<CreateWatchlistSheet> createState() => _CreateWatchlistSheetState();
}

class _CreateWatchlistSheetState extends State<CreateWatchlistSheet> {
  final TextEditingController _controller = TextEditingController();

  void _createWatchlist() async {
    final name = _controller.text.trim();
    if (name.isEmpty) return;

    await context.read<WatchlistCubit>().createWatchlist(name);
    if (mounted) {
      Navigator.pop(context);
      final message = "Watchlist '$name' created.";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomPadding, top: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 8),
                Text("Create new watchlist", style: TextStyles.textStyle_16_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                IconButton(icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onPrimary), onPressed: () => Navigator.pop(context)),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8.0), child: Divider(thickness: .3, color: Theme.of(context).colorScheme.onSecondary)),
            Text("Watchlist Name", style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
            const SizedBox(height: 8),
            CustomTextField(hintText: "Enter watchlist name", controller: _controller, radius: 10),
            const SizedBox(height: 24),
            Padding(padding: const EdgeInsets.only(bottom: 50), child: CustomButton(callback: () => _createWatchlist(), title: "Create")),
          ],
        ),
      ),
    );
  }
}
