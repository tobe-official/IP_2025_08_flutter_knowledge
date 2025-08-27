import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/overview/widgets/box.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_app_bar.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_bottom_navigator.dart';

final List<BoxWidget> _allBoxes = [
  BoxWidget(
    title: 'Constructor',
    description: 'This Screen has a normal constructor behind it. We used the default constructors to build this page.',
    isNamedConstructor: false,
    routerPath: '/global',
    color: Colors.blue,
  ),
  BoxWidget.transition(
    title: 'Named Constructors',
    description: 'This Screen has a named constructor behind it. We used the named constructors to build this page.',
    isNamedConstructor: true,
    routerPath: '/global',
    color: Colors.blue,
    secondaryColor: Colors.green,
    fontColor: Colors.white,
  ),
  BoxWidget(
    title: 'Canvas',
    routerPath: '/canvas',
    color: Colors.blue,
  ),
  BoxWidget(
    title: 'Streams',
    routerPath: '/streams',
  ),
];

@RoutePage()
class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late final TextEditingController _ctrl;
  late List<BoxWidget> _filtered;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController();
    _filtered = _allBoxes;
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onSearchChanged(String q) {
    final query = q.trim().toLowerCase();
    setState(() {
      _filtered = query.isEmpty
          ? _allBoxes
          : _allBoxes.where((box) => (box.title).toString().toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Overview'),
      body: _body(),
      bottomNavigationBar: const CustomBottomNavigator(initialIndexOfScreen: 1),
    );
  }

  Widget _searchField(BuildContext context) {
    return TextField(
      controller: _ctrl,
      onChanged: _onSearchChanged,
      autocorrect: false,
      cursorColor: Color(0xFF123456),
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
        labelText: 'Search for a feature',
        labelStyle: TextStyle(color: Color(0xFF123456)),
        hintText: 'Example: Streams',
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF123456)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF123456), width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        suffixIcon: _ctrl.text.trim().isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _ctrl.clear();
                  _onSearchChanged('');
                },
              ),
      ),
    );
  }

  Widget _boxesDisplay(BoxWidget box) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      child: box,
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          _searchField(context),
          const SizedBox(height: 24),
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: Text('Nothing found. Try again'))
                : ListView.separated(
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (_, i) => _boxesDisplay(_filtered[i]),
                  ),
          ),
        ],
      ),
    );
  }
}
