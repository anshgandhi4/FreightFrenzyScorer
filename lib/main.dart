/*
 * Copyright © 2021 Ansh Gandhi
 *
 * This file is part of Freight Frenzy Scorer.
 *
 * Freight Frenzy Scorer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Freight Frenzy Scorer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Freight Frenzy Scorer.  If not, see <https://www.gnu.org/licenses/>.
 *
 * Original Author: Ansh Gandhi
 * Original Source Code: <https://github.com/anshgandhi4/FreightFrenzyScorer>
 * Original Website: <http://roboavatars.weebly.com/freightfrenzyscorer.html>
 * Original Web App: <https://roboavatars.nibbleguru.com>
 * Original Android App: <https://play.google.com/store/apps/details?id=com.anshgandhi.freight_frenzy>
 *
 * EVERYTHING ABOVE THIS LINE MUST BE KEPT AS IS UNDER GNU GPL LICENSE RULES.
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freight_frenzy/num.dart';

int ascore = 0;
int tscore = 0;
int egscore = 0;
int pscore = 0;
int totalscore = 0;

Num _a1 = Num();
Num _a2 = Num();
Num _a3 = Num();
Num _a4 = Num();
Num _a5 = Num();
Num _a6 = Num();
Num _a7 = Num();
Num _a8 = Num();
Num _a9 = Num();

Num _t1 = Num();
Num _t2 = Num();
Num _t3 = Num();
Num _t4 = Num();
Num _t5 = Num();

Num _eg1 = Num();
Num _eg2 = Num();
Num _eg3 = Num();
Num _eg4 = Num();
Num _eg5 = Num();
Num _eg6 = Num();

Num _p1 = Num();
Num _p2 = Num();

Score score = Score();
SectionTitle aTitle = SectionTitle(title: 'Autonomous', update: getA);
SectionTitle tTitle = SectionTitle(title: 'Teleop', update: getT);
SectionTitle egTitle = SectionTitle(title: 'End Game', update: getEG);
SectionTitle pTitle = SectionTitle(title: 'Penalties', update: getP);

Auto auto = Auto();
Teleop teleop = Teleop();
EndGame endgame = EndGame();
Penalty penalty = Penalty();
List modes = [Logo(), auto, teleop, endgame, penalty];
bool mobile = true;

void titleReset() {
    totalscore = getA() + getT() + getEG() + getP();
    score.rebuild();
    aTitle.rebuild();
    tTitle.rebuild();
    egTitle.rebuild();
    pTitle.rebuild();
}

int getA() {
    return ascore;
}

void setA(int newA) {
    ascore = newA;
    titleReset();
}

void calcA() {
    setA(10 * _a1.getInt() + 3 * _a2.getInt() + 6 * _a3.getInt() + 5 * _a4.getInt() + 10 * _a5.getInt() + 2 * _a6.getInt() + 6 * _a7.getInt() + 10 * _a8.getInt() + 20 * _a9.getInt());
}

int getT() {
    return tscore;
}

void setT(int newT) {
    tscore = newT;
    titleReset();
}

void calcT() {
    setT(_t1.getInt() + 2 * _t2.getInt() + 4 * _t3.getInt() + 6 * _t4.getInt() + 4 * _t5.getInt());
}

int getEG() {
    return egscore;
}

void setEG(int newEG) {
    egscore = newEG;
    titleReset();
}

void calcEG() {
    setEG(6 * _eg1.getInt() + 10 * _eg2.getInt() + 20 * _eg3.getInt() + 3 * _eg4.getInt() + 6 * _eg5.getInt() + 15 * _eg6.getInt());
}

int getP() {
    return pscore;
}

void setP(int newP) {
    pscore = newP;
    titleReset();
}

void calcP() {
    setP(-10 * _p1.getInt() + -30 * _p2.getInt());
}

void main() => runApp(MaterialApp(
    home: Home()
));

class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                title: const Text(
                    'Freight Frenzy Scorer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                    ),
                ),
                centerTitle: true,
                backgroundColor: Colors.grey.shade900,
                elevation: 0.0,
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    const SizedBox(height: 8.0),
                    score,
                    const SizedBox(height: 8.0),
                    Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: modes.length,
                            itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    child: modes[index],
                                    margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                );
                            },
                            separatorBuilder: (BuildContext context, int index) => Card(
                                color: Colors.grey.shade300,
                                elevation: 0.0,
                                margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                                child: const SizedBox(height: 5.0),
                            ),
                        ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                        'Brought to You By:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                        ),
                    ),
                    const Text(
                        'FTC Team 7303 RoboAvatars',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    const SizedBox(height: 12.0),
                ],
            ),
        );
    }
}

class Score extends StatefulWidget {
    _ScoreState scoreState = _ScoreState();

    @override
    _ScoreState createState() {
        scoreState = _ScoreState();
        return scoreState;
    }

    void rebuild() {
        scoreState.rebuild();
    }
}

class _ScoreState extends State<Score> {
    @override
    Widget build(BuildContext context) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Text(
                    'Total Score: $totalscore',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                    icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                    ),
                    tooltip: 'Reset',
                    onPressed: () {
                        if (mounted) {
                            setState(() {
                                auto.reset();
                                teleop.reset();
                                endgame.reset();
                                penalty.reset();
                                calcA();
                                calcT();
                                calcEG();
                                calcP();
                            });
                        }
                    },
                ),
            ],
        );
    }

    void rebuild() {
        if (mounted) {
            setState(() {});
        }
    }
}

class SectionTitle extends StatefulWidget {
    SectionTitle({Key? key, required this.title, required this.update}) : super(key: key);

    final String title;
    final Function update;

    _SectionTitleState sectionTitleState = _SectionTitleState();

    @override
    _SectionTitleState createState() {
        sectionTitleState = _SectionTitleState();
        return sectionTitleState;
    }

    void rebuild() {
        sectionTitleState.rebuild();
    }
}

class _SectionTitleState extends State<SectionTitle> {
    String title = '';
    Function update = () {};

    @override
    Widget build(BuildContext context) {
        title = widget.title;
        update = widget.update;

        return Text(
            '$title: ${update().toInt()}',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
            ),
        );
    }

    void rebuild() {
        if (mounted) {
            setState(() {});
        }
    }
}

class CustomSlider extends StatefulWidget {
    CustomSlider({Key? key, required this.scorevar, required this.update, required this.minvar, required this.maxvar, this.parent}): super(key: key);

    final Num scorevar;
    final Function update;
    final double minvar;
    final double maxvar;
    final dynamic parent;

    _CustomSliderState customSliderState = _CustomSliderState();

    @override
    _CustomSliderState createState() => customSliderState;

    void rebuild() {
        customSliderState.rebuild();
    }
}

class _CustomSliderState extends State<CustomSlider> {
    late Num scorevar;
    late Function update;
    late double minvar;
    late double maxvar;
    dynamic parent;

    @override
    Widget build(BuildContext context) {
        scorevar = widget.scorevar;
        update = widget.update;
        minvar = widget.minvar;
        maxvar = widget.maxvar;
        parent = widget.parent;

        return SliderTheme(
            data: SliderThemeData(
                activeTickMarkColor: Colors.grey.shade200,
                activeTrackColor: Colors.grey.shade700,
                inactiveTickMarkColor: Colors.grey.shade300,
                inactiveTrackColor: Colors.grey.shade500,
                thumbColor: Colors.grey.shade800,
            ),
            child: SizedBox(
                width: 150.0,
                child: Slider(
                    value: scorevar.get(),
                    onChanged: (double value) {
                        scorevar.set(value);
                        update();
                        if (mounted) {
                            setState(() {
                                scorevar.set(value);
                            });
                        }
                    },
                    min: minvar,
                    max: maxvar,
                    divisions: (maxvar - minvar).toInt(),
                    label: '${scorevar.getInt()}',
                ),
            ),
        );
    }

    void rebuild() {
        if (mounted) {
            setState(() {
                update();
            });
        }
    }
}

class CustomButtonInput extends StatefulWidget {
    CustomButtonInput({Key? key, required this.scorevar, required this.update, this.parent}) : super(key: key);

    final Num scorevar;
    final Function update;
    final dynamic parent;

    _CustomButtonInputState customButtonInputState = _CustomButtonInputState();

    @override
    _CustomButtonInputState createState() => customButtonInputState;

    void rebuild() {
        customButtonInputState.rebuild();
    }
}

class _CustomButtonInputState extends State<CustomButtonInput> {
    late Num scorevar;
    late Function update;
    late int maxlength;
    dynamic parent;

    @override
    Widget build(BuildContext context) {
        scorevar = widget.scorevar;
        update = widget.update;
        parent = widget.parent;

        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                SizedBox(
                    width: 54.0,
                    child: MaterialButton(
                        child: const Text('-1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                            )
                        ),
                        color: Colors.grey.shade800,
                        elevation: mobile ? 4.0 : 8.0,
                        onPressed: () {
                            scorevar.setInt(scorevar.getInt() > 0 ? scorevar.getInt() - 1 : 0);
                            update();
                            if (mounted) {
                                setState(() {});
                            }
                        },
                        padding: EdgeInsets.all(mobile ? 15.0 : 20.0),
                        shape: const CircleBorder(),
                    ),
                ),
                const SizedBox(width: 5.0),
                SizedBox(
                    width: 54.0,
                    child: MaterialButton(
                        child: const Text('+1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                            )
                        ),
                        color: Colors.grey.shade800,
                        elevation: mobile ? 4.0 : 8.0,
                        onPressed: () {
                            scorevar.setInt(scorevar.getInt() + 1);
                            update();
                            if (mounted) {
                                setState(() {});
                            }
                        },
                        padding: EdgeInsets.all(mobile ? 15.0 : 20.0),
                        shape: const CircleBorder(),
                    ),
                ),
                const SizedBox(width: 5.0),
                Card(
                    color: Colors.grey.shade700,
                    elevation: mobile ? 4.0 : 8.0,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '${scorevar.getInt()}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),
                ),
                const SizedBox(width: 15.0),
            ],
        );
    }

    void rebuild() {
        if (mounted) {
            setState(() {
                scorevar.setInt(0);
                update();
            });
        }
    }
}

class Logo extends StatefulWidget {
    @override
    _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
    @override
    Widget build(BuildContext context) {
        return Image.asset(
            'assets/FreightFrenzyLogo.png',
            height: 125,
            width: 125,
        );
    }
}

class Auto extends StatefulWidget {
    _AutoState autoState = _AutoState();

    @override
    _AutoState createState() {
        auto = this;
        autoState = _AutoState();
        return autoState;
    }

    void reset() {
        _a1.setInt(0);
        _a2.setInt(0);
        _a3.setInt(0);
        _a4.setInt(0);
        _a5.setInt(0);
        _a6.setInt(0);
        _a7.setInt(0);
        _a8.setInt(0);
        _a9.setInt(0);
        autoState.rebuild();
    }

    void rebuild() {
        autoState.rebuild();
    }
}

class _AutoState extends State<Auto> {
    late CustomSlider a1;
    late CustomSlider a2;
    late CustomSlider a3;
    late CustomSlider a4;
    late CustomSlider a5;
    late CustomButtonInput a6;
    late CustomButtonInput a7;
    late CustomSlider a8;
    late CustomSlider a9;

    @override
    Widget build(BuildContext context) {
        a1 = CustomSlider(scorevar: _a1, update: calcA, minvar: 0, maxvar: 1, parent: this);
        a2 = CustomSlider(scorevar: _a2, update: calcA, minvar: 0, maxvar: 2, parent: this);
        a3 = CustomSlider(scorevar: _a3, update: calcA, minvar: 0, maxvar: 2, parent: this);
        a4 = CustomSlider(scorevar: _a4, update: calcA, minvar: 0, maxvar: 2, parent: this);
        a5 = CustomSlider(scorevar: _a5, update: calcA, minvar: 0, maxvar: 2, parent: this);
        a6 = CustomButtonInput(scorevar: _a6, update: calcA, parent: this);
        a7 = CustomButtonInput(scorevar: _a7, update: calcA, parent: this);
        a8 = CustomSlider(scorevar: _a8, update: calcA, minvar: 0, maxvar: 2, parent: this);
        a9 = CustomSlider(scorevar: _a9, update: calcA, minvar: 0, maxvar: 2, parent: this);

        return Card(
            color: Colors.grey.shade900,
            elevation: 10.0,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                        aTitle,
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a1,
                                const Text(
                                    'Ducks Delivered',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a2,
                                const Text(
                                    'Storage Park',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a3,
                                const Text(
                                    'Full Storage Park',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                  ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a4,
                                const Text(
                                    'Warehouse Park',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a5,
                                const Text(
                                    'Full Warehouse Park',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a6,
                                const Text(
                                    'Storage Unit Freights',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a7,
                                const Text(
                                    'Shipping Hub Freights',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a8,
                                const Text(
                                    'Duck Bonus',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a9,
                                const Text(
                                    'Team Element Bonus',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }

    void rebuild() {
        if (mounted) {
            setState(() {});
        }
    }
}

class Teleop extends StatefulWidget {
    _TeleopState teleopState = _TeleopState();

    @override
    _TeleopState createState() {
        teleop = this;
        teleopState = _TeleopState();
        return teleopState;
    }

    void reset() {
        _t1.setInt(0);
        _t2.setInt(0);
        _t3.setInt(0);
        _t4.setInt(0);
        _t5.setInt(0);
        teleopState.rebuild();
    }

    void rebuild() {
        teleopState.rebuild();
    }
}

class _TeleopState extends State<Teleop> {
    late CustomButtonInput t1;
    late CustomButtonInput t2;
    late CustomButtonInput t3;
    late CustomButtonInput t4;
    late CustomButtonInput t5;

    @override
    Widget build(BuildContext context) {
        t1 = CustomButtonInput(scorevar: _t1, update: calcT, parent: this);
        t2 = CustomButtonInput(scorevar: _t2, update: calcT, parent: this);
        t3 = CustomButtonInput(scorevar: _t3, update: calcT, parent: this);
        t4 = CustomButtonInput(scorevar: _t4, update: calcT, parent: this);
        t5 = CustomButtonInput(scorevar: _t5, update: calcT, parent: this);

        return Card(
            color: Colors.grey.shade900,
            elevation: 10.0,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                      tTitle,
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              t1,
                              const Text(
                                  'Storage Unit Freights',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              t2,
                              const Text(
                                  'Level 1 Freights',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              t3,
                              const Text(
                                  'Level 2 Freights',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              t4,
                              const Text(
                                  'Level 3 Freights',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              t5,
                              const Text(
                                  'Shared Hub Freights',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                    ],
                ),
            ),
        );
    }

    void rebuild() {
        if (mounted) {
            setState(() {});
        }
    }
}

class EndGame extends StatefulWidget {
    _EndGameState endGameState = _EndGameState();

    @override
    _EndGameState createState() {
        endgame = this;
        endGameState = _EndGameState();
        return endGameState;
    }

    void reset() {
        _eg1.setInt(0);
        _eg2.setInt(0);
        _eg3.setInt(0);
        _eg4.setInt(0);
        _eg5.setInt(0);
        _eg6.setInt(0);
        endGameState.rebuild();
    }

    void rebuild() {
        endGameState.rebuild();
    }
}

class _EndGameState extends State<EndGame> {
    late CustomSlider eg1;
    late CustomSlider eg2;
    late CustomSlider eg3;
    late CustomSlider eg4;
    late CustomSlider eg5;
    late CustomSlider eg6;

    @override
    Widget build(BuildContext context) {
        eg1 = CustomSlider(scorevar: _eg1, update: calcEG, minvar: 0, maxvar: 12, parent: this);
        eg2 = CustomSlider(scorevar: _eg2, update: calcEG, minvar: 0, maxvar: 1, parent: this);
        eg3 = CustomSlider(scorevar: _eg3, update: calcEG, minvar: 0, maxvar: 1, parent: this);
        eg4 = CustomSlider(scorevar: _eg4, update: calcEG, minvar: 0, maxvar: 2, parent: this);
        eg5 = CustomSlider(scorevar: _eg5, update: calcEG, minvar: 0, maxvar: 2, parent: this);
        eg6 = CustomSlider(scorevar: _eg6, update: calcEG, minvar: 0, maxvar: 2, parent: this);

        return Card(
            color: Colors.grey.shade900,
            elevation: 10.0,
            child: Padding(
                padding: const  EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                      egTitle,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg1,
                              const Text(
                                  'Ducks Delivered',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg2,
                              const Text(
                                  'Alliance Hub Balance',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg3,
                              const Text(
                                  'Shared Hub Tip',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg4,
                              const Text(
                                  'Warehouse Park',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg5,
                              const Text(
                                  'Full Warehouse Park',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg6,
                              const Text(
                                  'Shipping Hub Caps',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                  ),
                              ),
                          ],
                      ),
                    ],
                ),
            ),
        );
    }

    void rebuild() {
        if (mounted) {
            setState(() {});
        }
    }
}

class Penalty extends StatefulWidget {
    _PenaltyState penaltyState = _PenaltyState();

    @override
    _PenaltyState createState() {
        penalty = this;
        penaltyState = _PenaltyState();
        return penaltyState;
    }

    void reset() {
        _p1.setInt(0);
        _p2.setInt(0);
        penaltyState.rebuild();
    }

    void rebuild() {
        penaltyState.rebuild();
    }
}

class _PenaltyState extends State<Penalty> {
    late CustomButtonInput p1;
    late CustomButtonInput p2;

    @override
    Widget build(BuildContext context) {
        p1 = CustomButtonInput(scorevar: _p1, update: calcP, parent: this);
        p2 = CustomButtonInput(scorevar: _p2, update: calcP, parent: this);

        return Card(
            color: Colors.grey.shade900,
            elevation: 10.0,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                        pTitle,
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                p1,
                                const Text(
                                    'Minor',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                p2,
                                const Text(
                                    'Major',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                    ),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }

    void rebuild() {
        if (mounted) {
            setState(() {});
        }
    }
}