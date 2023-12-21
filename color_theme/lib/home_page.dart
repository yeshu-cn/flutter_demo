import 'dart:io';
import 'package:color_theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkMode = false;
  String _imagePath = '';

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: colorScheme.primary,
        // foregroundColor: colorScheme.onPrimary,
        centerTitle: true,
        title: const Text('Dynamic Color'),
        actions: [
          const Icon(Icons.light_mode),
          Switch(
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
                Provider.of<ThemeProvider>(context, listen: false)
                    .setThemeMode(darkMode ? ThemeMode.dark : ThemeMode.light);
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(children: [
            _buildImage(),
            Positioned(
                bottom: 20,
                right: 20,
                child: IconButton(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.camera_alt_outlined),
                )),
          ]),
          Expanded(
            child: PageView(
              children: [
                SingleChildScrollView(child: _buildFlutterMaterialColorScheme(colorScheme)),
                SingleChildScrollView(child: _buildCompleteMaterialColorScheme(colorScheme)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlutterMaterialColorScheme(ColorScheme colorScheme) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Material Design Color Scheme in Flutter'),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // primary, onPrimary, primaryContainer, onPrimaryContainer
                          _buildFlutterColorRole(
                              title: 'primary', color: colorScheme.primary, textColor: colorScheme.onPrimary),
                          _buildFlutterColorRole(
                              title: 'onPrimary', color: colorScheme.onPrimary, textColor: colorScheme.primary),
                          _buildFlutterColorRole(
                              title: 'primaryContainer',
                              color: colorScheme.primaryContainer,
                              textColor: colorScheme.onPrimaryContainer),
                          _buildFlutterColorRole(
                              title: 'onPrimaryContainer',
                              color: colorScheme.onPrimaryContainer,
                              textColor: colorScheme.primaryContainer),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFlutterColorRole(
                              title: 'secondary', color: colorScheme.secondary, textColor: colorScheme.onSecondary),
                          _buildFlutterColorRole(
                              title: 'onSecondary', color: colorScheme.onSecondary, textColor: colorScheme.secondary),
                          _buildFlutterColorRole(
                              title: 'secondaryContainer',
                              color: colorScheme.secondaryContainer,
                              textColor: colorScheme.onSecondaryContainer),
                          _buildFlutterColorRole(
                              title: 'onSecondaryContainer',
                              color: colorScheme.onSecondaryContainer,
                              textColor: colorScheme.secondaryContainer),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // primary, onPrimary, primaryContainer, onPrimaryContainer
                          _buildFlutterColorRole(
                              title: 'tertiary', color: colorScheme.tertiary, textColor: colorScheme.onTertiary),
                          _buildFlutterColorRole(
                              title: 'onTertiary', color: colorScheme.onTertiary, textColor: colorScheme.tertiary),
                          _buildFlutterColorRole(
                              title: 'tertiaryContainer',
                              color: colorScheme.tertiaryContainer,
                              textColor: colorScheme.onTertiaryContainer),
                          _buildFlutterColorRole(
                              title: 'onTertiaryContainer',
                              color: colorScheme.onTertiaryContainer,
                              textColor: colorScheme.tertiaryContainer),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFlutterColorRole(
                              title: 'error', color: colorScheme.error, textColor: colorScheme.onError),
                          _buildFlutterColorRole(
                              title: 'onError', color: colorScheme.onError, textColor: colorScheme.error),
                          _buildFlutterColorRole(
                              title: 'errorContainer',
                              color: colorScheme.errorContainer,
                              textColor: colorScheme.onErrorContainer),
                          _buildFlutterColorRole(
                              title: 'onErrorContainer',
                              color: colorScheme.onErrorContainer,
                              textColor: colorScheme.errorContainer),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFlutterColorRole(
                              title: 'surface', color: colorScheme.surface, textColor: colorScheme.onSurface),
                          _buildFlutterColorRole(
                              title: 'onSurface', color: colorScheme.onSurface, textColor: colorScheme.surface),
                          _buildFlutterColorRole(
                              title: 'surfaceVariant', color: colorScheme.surfaceVariant, textColor: colorScheme.onSurfaceVariant),
                          _buildFlutterColorRole(
                              title: 'onSurfaceVariant',
                              color: colorScheme.onSurfaceVariant,
                              textColor: colorScheme.surfaceVariant),
                          _buildFlutterColorRole(
                              title: 'surfaceTint',
                              color: colorScheme.surfaceTint,
                              textColor: colorScheme.onPrimary),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFlutterColorRole(
                              title: 'background', color: colorScheme.background, textColor: colorScheme.onBackground),
                          _buildFlutterColorRole(
                              title: 'onBackground', color: colorScheme.onBackground, textColor: colorScheme.background),
                          _buildFlutterColorRole(
                              title: 'scrim', color: colorScheme.scrim, textColor: colorScheme.onPrimary),
                          _buildFlutterColorRole(
                              title: 'shadow', color: colorScheme.shadow, textColor: colorScheme.background),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFlutterColorRole(
                              title: 'inverseSurface', color: colorScheme.inverseSurface, textColor: colorScheme.onInverseSurface),
                          _buildFlutterColorRole(
                              title: 'onInverseSurface', color: colorScheme.onInverseSurface, textColor: colorScheme.inverseSurface),
                          _buildFlutterColorRole(
                              title: 'InversePrimary', color: colorScheme.inversePrimary, textColor: colorScheme.onSurface),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFlutterColorRole(
                              title: 'outline', color: colorScheme.outline, textColor: colorScheme.onPrimary),
                          _buildFlutterColorRole(
                              title: 'outlineVariant', color: colorScheme.outlineVariant, textColor: colorScheme.onSurfaceVariant),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFlutterColorRole({required String title, required Color color, required Color textColor}) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        width: double.infinity,
        color: color,
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ));
  }

  Widget _buildCompleteMaterialColorScheme(ColorScheme colorScheme) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Material Design Color Scheme in M3'),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // primary, secondary, tertiary, error
                  _buildColorRole(title: 'primary', color: colorScheme.primary, textColor: colorScheme.onPrimary),
                  _buildColorRole(title: 'secondary', color: colorScheme.secondary, textColor: colorScheme.onSecondary),
                  _buildColorRole(title: 'tertiary', color: colorScheme.tertiary, textColor: colorScheme.onTertiary),
                  _buildColorRole(title: 'error', color: colorScheme.error, textColor: colorScheme.onError),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // onPrimary, onSecondary, onTertiary, onError
                  _buildColorRole(title: 'onPrimary', color: colorScheme.onPrimary, textColor: colorScheme.primary),
                  _buildColorRole(title: 'onSecondary', color: colorScheme.onSecondary, textColor: colorScheme.secondary),
                  _buildColorRole(title: 'onTertiary', color: colorScheme.onTertiary, textColor: colorScheme.tertiary),
                  _buildColorRole(title: 'onError', color: colorScheme.onError, textColor: colorScheme.error),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // primary Container, secondary Container, tertiary Container, error Container
                  _buildColorRole(
                      title: 'primary Container',
                      color: colorScheme.primaryContainer,
                      textColor: colorScheme.onPrimaryContainer),
                  _buildColorRole(
                      title: 'secondary Container',
                      color: colorScheme.secondaryContainer,
                      textColor: colorScheme.onSecondaryContainer),
                  _buildColorRole(
                      title: 'tertiary Container',
                      color: colorScheme.tertiaryContainer,
                      textColor: colorScheme.onTertiaryContainer),
                  _buildColorRole(
                      title: 'error Container', color: colorScheme.errorContainer, textColor: colorScheme.onErrorContainer),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // On Primary Container, On Secondary Container, On Tertiary Container, On Error Container
                  _buildColorRole(
                      title: 'On Primary Container',
                      color: colorScheme.onPrimaryContainer,
                      textColor: colorScheme.primaryContainer),
                  _buildColorRole(
                      title: 'On Secondary Container',
                      color: colorScheme.onSecondaryContainer,
                      textColor: colorScheme.secondaryContainer),
                  _buildColorRole(
                      title: 'On Tertiary Container',
                      color: colorScheme.onTertiaryContainer,
                      textColor: colorScheme.tertiaryContainer),
                  _buildColorRole(
                      title: 'On Error Container',
                      color: colorScheme.onErrorContainer,
                      textColor: colorScheme.errorContainer),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Primary Fixed, Secondary Fixed, Tertiary Fixed
                  Expanded(
                    child: Row(
                      children: [
                        _buildColorRole(title: 'Primary Fixed', height: 110.0),
                        _buildColorRole(title: 'Primary Fixed Dim', height: 110.0),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildColorRole(title: 'Secondary Fixed', height: 110.0),
                        _buildColorRole(title: 'Secondary Fixed Dim', height: 110.0),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildColorRole(title: 'Tertiary Fixed', height: 110.0),
                        _buildColorRole(title: 'Tertiary Fixed Dim', height: 110.0),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // OnPrimary Fixed, OnSecondary Fixed, OnTertiary Fixed
                  _buildColorRole(title: 'OnPrimary Fixed'),
                  _buildColorRole(title: 'OnSecondary Fixed'),
                  _buildColorRole(title: 'OnTertiary Fixed'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // OnPrimary Fixed Variant, OnSecondary Fixed Variant, OnTertiary Fixed Variant
                  _buildColorRole(title: 'OnPrimary Fixed Variant'),
                  _buildColorRole(title: 'OnSecondary Fixed Variant'),
                  _buildColorRole(title: 'OnTertiary Fixed Variant'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Surface Dim, Surface, Surface Bright
                  _buildColorRole(title: 'Surface Dim'),
                  _buildColorRole(title: 'Surface', color: colorScheme.surface, textColor: colorScheme.onSurface),
                  _buildColorRole(title: 'Surface Bright'),
                  _buildColorRole(
                      title: 'Inverse Surface', color: colorScheme.inverseSurface, textColor: colorScheme.onInverseSurface),
                  _buildColorRole(
                      title: 'Inverse On Surface',
                      color: colorScheme.onInverseSurface,
                      textColor: colorScheme.inverseSurface),
                  _buildColorRole(title: 'Inverse Primary', color: colorScheme.inversePrimary, textColor: Colors.black),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Surface container lowest, Surface container low, Surface container, Surface container high, Surface container highest
                  _buildColorRole(title: 'Surface container lowest'),
                  _buildColorRole(title: 'Surface container low'),
                  _buildColorRole(title: 'Surface container'),
                  _buildColorRole(title: 'Surface container high'),
                  _buildColorRole(title: 'Surface container highest'),
                ],
              ),
              Row(
                children: [
                  // On surface, On Surface Variant, Outline, Outline Variant, Scrim, Shadow
                  _buildColorRole(title: 'On surface', color: colorScheme.onSurface, textColor: colorScheme.surface),
                  _buildColorRole(
                      title: 'On Surface Variant',
                      color: colorScheme.onSurfaceVariant,
                      textColor: colorScheme.surfaceVariant),
                  _buildColorRole(title: 'Outline', color: colorScheme.outline, textColor: Colors.white),
                  _buildColorRole(title: 'Outline Variant', color: colorScheme.outlineVariant, textColor: Colors.white),
                  _buildColorRole(title: 'Scrim', color: colorScheme.scrim, textColor: Colors.white),
                  _buildColorRole(title: 'Shadow', color: colorScheme.shadow, textColor: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorRole(
      {required String title, Color color = Colors.grey, textColor = Colors.white, withPadding = true, height = 75.0}) {
    return Expanded(
      child: Padding(
        padding: withPadding ? const EdgeInsets.all(1) : const EdgeInsets.all(0),
        child: Container(
          padding: const EdgeInsets.all(4),
          height: height,
          color: color,
          child: Text(
            title,
            softWrap: true,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var lightColorScheme = await ColorScheme.fromImageProvider(provider: FileImage(File(image.path)));
      var darkColorScheme =
          await ColorScheme.fromImageProvider(provider: FileImage(File(image.path)), brightness: Brightness.dark);
      if (mounted) {
        Provider.of<ThemeProvider>(context, listen: false).setThemeColorScheme(lightColorScheme);
        Provider.of<ThemeProvider>(context, listen: false).setDarkColorScheme(darkColorScheme);
      }

      setState(() {
        _imagePath = image.path;
      });
    }
  }

  Widget _buildImage() {
    return _imagePath.isEmpty
        ? Image.asset(
            'assets/images/image.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: 300,
          )
        : Image(
            image: FileImage(File(_imagePath)),
            fit: BoxFit.fill,
            width: double.infinity,
            height: 300,
          );
  }
}
