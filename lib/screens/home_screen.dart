import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'label': 'Safe Room', 'icon': Icons.shield},
    {'label': 'Offline AI', 'icon': Icons.memory},
    {'label': 'Stockpile', 'icon': Icons.inventory},
    {'label': 'Tools', 'icon': Icons.build},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double threat = 0.45; // 0.0‒1.0 – change this value to test
    Color glow = (threat < 0.50)
        ? Colors.greenAccent
        : (threat < 0.80)
        ? Colors.orangeAccent
        : Colors.redAccent;
    return Scaffold(
      appBar: AppBar(title: Text('Survival Dashboard'), centerTitle: true),
      body: Column(
        children: [
          // ─────────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1)  Label (“DOOM”)  and  Percentage (“60%”)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DOOM',
                      style: GoogleFonts.orbitron(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: glow,
                        shadows: [Shadow(blurRadius: 10, color: glow)],
                      ),
                    ),
                    Text(
                      '${(threat * 100).round()}%',
                      style: GoogleFonts.orbitron(
                        color: glow,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: glow, blurRadius: 6),
                          Shadow(color: glow, blurRadius: 12),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // 2)  Glowing progress bar with scanline + sparks
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: glow.withValues(alpha: 0.8),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: glow.withValues(alpha: 0.7),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // background track
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            22,
                            22,
                            22,
                          )!.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      // glowing foreground fill
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: threat,
                          child:
                              Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      gradient: RadialGradient(
                                        center: Alignment.center,
                                        radius: 2.5,
                                        colors: [
                                          glow.withValues(alpha: 0.6),
                                          glow.withValues(alpha: 0.2),
                                          Colors.transparent,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: glow.withValues(alpha: 0.85),
                                          blurRadius: 30,
                                          spreadRadius: 8,
                                          offset: Offset(0, 0),
                                        ),
                                        BoxShadow(
                                          color: glow.withValues(alpha: 0.4),
                                          blurRadius: 30,
                                          spreadRadius: 8,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  )
                                  .animate(
                                    onPlay: (c) => c.repeat(reverse: true),
                                  )
                                  .scaleXY(
                                    end: 1.01,
                                    duration: 1200.ms,
                                    curve: Curves.easeInOut,
                                  )
                                  .shimmer(duration: 1000.ms)
                                  .shake(duration: 600.ms, hz: 0.3),
                        ),
                      ),

                      // scanline overlay
                      Positioned.fill(
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: [
                                Colors.white.withValues(alpha: 0.03),
                                Colors.transparent,
                                Colors.white.withValues(alpha: 0.03),
                              ],
                              stops: [0.0, 0.5, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              tileMode: TileMode.mirror,
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcOver,
                          child: Container(
                            color: Colors.white.withValues(alpha: 0.02),
                          ),
                        ),
                      ),

                      // glitch sparks
                      ...List.generate(6, (i) {
                        final rnd = Random(i);
                        final top = rnd.nextDouble() * 18;
                        final left = rnd.nextDouble() * 300;
                        final width = rnd.nextDouble() * 10 + 2;

                        return Positioned(
                          top: top,
                          left: left,
                          child:
                              Container(
                                    width: width,
                                    height: 1,
                                    color: Colors.white.withValues(alpha: 0.15),
                                  )
                                  .animate(
                                    onPlay: (c) => c.repeat(
                                      period: Duration(
                                        milliseconds: (500 + rnd.nextInt(400)),
                                      ),
                                      reverse: true,
                                    ),
                                  )
                                  .fadeIn(duration: 80.ms)
                                  .fadeOut(duration: 80.ms),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ─────────────────────────────────────────────────────────
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: features.map((feature) {
                return ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to feature screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    padding: EdgeInsets.all(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(feature['icon'], size: 40),
                      SizedBox(height: 10),
                      Text(feature['label']),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
