import 'dart:math';

import 'package:exam_task/pages/pdfexport/pdfpreview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/data.dart';

const String onePerHour = '1/hour';
const String onePerYear = '1/year';
const String fit = 'FIT';
const String hour = 'Hour';
const String year = 'Year';
const String percent = '%';
const String abs = '| | (Abs)';

class RegisterInputPage extends StatefulWidget {
  const RegisterInputPage({super.key});

  @override
  State<RegisterInputPage> createState() => _RegisterInputPageState();
}

class _RegisterInputPageState extends State<RegisterInputPage> {
  final List<String> _firstList = <String>[onePerHour, onePerYear, fit];
  final List<String> _secondList = <String>[hour, year];
  final List<String> _thirdList = <String>[percent, abs];
  final double cnt = 1.0 * pow(10, -9);
  final double none = -777;

  String _l_Item = fit;
  String _ld_Item = fit;
  String _ldu_Item = fit;
  String _ldd_Item = fit;
  String _lsu_Item = fit;
  String _lsd_Item = fit;
  String _mttf_Item = hour;
  String _t1_Item = hour;
  String _dc_Item = percent;
  String _sff_Item = percent;

  final _companyController = TextEditingController();
  final _modelController = TextEditingController();
  final _l_Controller = TextEditingController();
  final _ld_Controller = TextEditingController();
  final _ldu_Controller = TextEditingController();
  final _ldd_Controller = TextEditingController();
  final _lsu_Controller = TextEditingController();
  final _lsd_Controller = TextEditingController();
  final _mttf_Controller = TextEditingController();
  final _t1_Controller = TextEditingController();
  final _dc_Controller = TextEditingController();
  final _sff_Controller = TextEditingController();

  @override
  void dispose() {
    _companyController.dispose();
    _modelController.dispose();
    _l_Controller.dispose();
    _ld_Controller.dispose();
    _ldu_Controller.dispose();
    _ldd_Controller.dispose();
    _lsu_Controller.dispose();
    _lsd_Controller.dispose();
    _mttf_Controller.dispose();
    _t1_Controller.dispose();
    _dc_Controller.dispose();
    _sff_Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer to PDF'),
        actions: [
          IconButton(
              onPressed: () {
                List<String> ans = submitFile();
                var collectedData = Data(
                    company: ans.elementAt(0),
                    model: ans.elementAt(1),
                    items: [
                      LineItem("L", ans.elementAt(2), _l_Item),
                      LineItem("Ld", ans.elementAt(3), _ld_Item),
                      LineItem("Ldu", ans.elementAt(4), _ldu_Item),
                      LineItem("Ldd", ans.elementAt(5), _ldd_Item),
                      LineItem("Lsu", ans.elementAt(6), _lsu_Item),
                      LineItem("Lsd", ans.elementAt(7), _lsd_Item),
                      LineItem("MTTF", ans.elementAt(8), _mttf_Item),
                      LineItem("T1", ans.elementAt(9), _t1_Item),
                      LineItem("DC", ans.elementAt(10), _dc_Item),
                      LineItem("SFF", ans.elementAt(11), _sff_Item),
                      LineItem("PFD", ans.elementAt(12), ""),
                    ]
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PdfPreviewPage(data: collectedData),
                  ),
                );
              },
              icon: const Icon(
                Icons.picture_as_pdf,
                size: 35,
              )),
        ],
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _companyController,
                    decoration: const InputDecoration(
                      labelText: 'Производитель',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: TextFormField(
                    controller: _modelController,
                    decoration: const InputDecoration(
                      labelText: 'Модель',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _l_Controller,
                    decoration: const InputDecoration(
                      labelText: 'L',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _firstList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _l_Item = data!;
                      });
                    },
                    value: _l_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _ld_Controller,
                    decoration: const InputDecoration(
                      labelText: 'Ld',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _firstList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _ld_Item = data!;
                      });
                    },
                    value: _ld_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _ldu_Controller,
                    decoration: const InputDecoration(
                      labelText: 'Ldu',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _firstList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _ldu_Item = data!;
                      });
                    },
                    value: _ldu_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _ldd_Controller,
                    decoration: const InputDecoration(
                      labelText: 'Ldd',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _firstList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _ldd_Item = data!;
                      });
                    },
                    value: _ldd_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _lsu_Controller,
                    decoration: const InputDecoration(
                      labelText: 'Lsu',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _firstList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _lsu_Item = data!;
                      });
                    },
                    value: _lsu_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _lsd_Controller,
                    decoration: const InputDecoration(
                      labelText: 'Lsd',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _firstList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _lsd_Item = data!;
                      });
                    },
                    value: _lsd_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _mttf_Controller,
                    decoration: const InputDecoration(
                      labelText: 'MTTF',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _secondList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _mttf_Item = data!;
                      });
                    },
                    value: _mttf_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _t1_Controller,
                    decoration: const InputDecoration(
                      labelText: 'T1',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _secondList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _t1_Item = data!;
                      });
                    },
                    value: _t1_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _dc_Controller,
                    decoration: const InputDecoration(
                      labelText: 'DC',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _thirdList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _dc_Item = data!;
                      });
                    },
                    value: _dc_Item,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _sff_Controller,
                    decoration: const InputDecoration(
                      labelText: 'SFF',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      labelText: 'Единиц',
                    ),
                    items: _thirdList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _sff_Item = data!;
                      });
                    },
                    value: _sff_Item,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> submitFile() {
    String company = _companyController.text;
    String model = _modelController.text;
    double L = double.parse(_l_Controller.text);
    double Ld = double.parse(_ld_Controller.text);
    double Ldu = double.parse(_ldu_Controller.text);
    double Ldd = double.parse(_ldd_Controller.text);
    double Lsu = double.parse(_lsu_Controller.text);
    double Lsd = double.parse(_lsd_Controller.text);
    double T0 = double.parse(_mttf_Controller.text);
    double T1 = double.parse(_t1_Controller.text);
    double DC = double.parse(_dc_Controller.text);
    double SFF = double.parse(_sff_Controller.text);

    if (company == "" && model == "") return [];

    L *= cnt;
    Ld *= cnt;
    Ldu *= cnt;
    Ldd *= cnt;
    Lsu *= cnt;
    Lsd *= cnt;

    if (_l_Item == onePerYear) {
      L *= 8760;
    } else if (_l_Item == fit) {
      L = none;
    }
    if (_ld_Item == onePerYear) {
      Ld *= 8760;
    } else if (_ld_Item == fit) {
      Ld = none;
    }
    if (_ldu_Item == onePerYear) {
      Ldu *= 8760;
    } else if (_ldu_Item == fit) {
      Ldu = none;
    }
    if (_ldd_Item == onePerYear) {
      Ldd *= 8760;
    } else if (_ldd_Item == fit) {
      Ldd = none;
    }
    if (_lsu_Item == onePerYear) {
      Lsu *= 8760;
    } else if (_lsu_Item == fit) {
      Lsu = none;
    }
    if (_lsd_Item == onePerYear) {
      Lsd *= 8760;
    } else if (_lsd_Item == fit) {
      Lsd = none;
    }
    if (_mttf_Item == hour) {
      T0 /= 8760;
    } else if (_mttf_Item == year) {
      T0 = none;
    }
    if (_t1_Item == hour) {
      T1 /= 8760;
    } else if (_t1_Item == year) {
      T1 = none;
    }
    if (_dc_Item == hour) {
      DC *= 100;
    } else if (_dc_Item == percent) {
      DC = none;
    }
    if (_sff_Item == hour) {
      SFF /= 100;
    } else if (_sff_Item == percent) {
      SFF = none;
    }

    List<double> list = recovery(L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF);
    L = list.elementAt(0);
    Ld = list.elementAt(1);
    Ldu = list.elementAt(2);
    Ldd = list.elementAt(3);
    Lsu = list.elementAt(4);
    Lsd = list.elementAt(5);
    T0 = list.elementAt(6);
    T1 = list.elementAt(7);
    DC = list.elementAt(8);
    SFF = list.elementAt(9);

    double pdf = none;
    pdf = pdfAvgMaker(L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF);

    if (pdf != none) {
      if (L < 0.01 && L != 0.0) {
        L = 0.01;
      }
      String sL = L.toStringAsFixed(2);
      if (Ld < 0.01 && Ld != 0.0) {
        Ld = 0.01;
      }
      String sLd = Ld.toStringAsFixed(2);
      if (Ldu < 0.01 && Ldu != 0.0) {
        Ldu = 0.01;
      }
      String sLdu = Ldu.toStringAsFixed(2);
      if (Ldd < 0.01 && Ldd != 0.0) {
        Ldd = 0.01;
      }
      String sLdd = Ldd.toStringAsFixed(2);
      if (Lsu < 0.01 && Lsu != 0.0) {
        Lsu = 0.01;
      }
      String sLsu = Lsu.toStringAsFixed(2);
      if (Lsd < 0.01 && Lsd != 0.0) {
        Lsd = 0.01;
      }
      String sLsd = Lsd.toStringAsFixed(2);

      if (T0 < 0.01 && T0 != 0.0) {
        T0 = 0.01;
      }
      String sT0 = T0.toStringAsFixed(2);
      if (T1 < 0.01 && T1 != 0.0) {
        T1 = 0.01;
      }
      String sT1 = T1.toStringAsFixed(2);

      if (DC < 0.01 && DC != 0.0) {
        DC = 0.01;
      }
      String sDC = DC.toStringAsFixed(2);
      if (SFF < 0.01 && SFF != 0.0) {
        SFF = 0.01;
      }
      String sSFF = SFF.toStringAsFixed(2);

      final numberFormat = NumberFormat('0.00e+0');
      String pfd = numberFormat.format(pdf);

      return [company, model, sL, sLd, sLdu, sLdd, sLsu, sLsd, sT0, sT1, sDC, sSFF, pfd];
    }
    return [];
  }

  List<double> recovery(L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF) {
    if (L != none && Ld != none) {
      if (Ld == L) {
        Lsu = 0.0;
        Lsd = 0.0;
        if (SFF != none && DC != none) {
          if (SFF == none) {
            SFF = DC;
          } else {
            DC = SFF;
          }
        }
      }

      if (Ldd != none || Ldu != none) {
        if (Ldd != none) {
          DC = (Ldd / L) * 100.0;
          SFF = DC;
        } else {
          DC = (1.0 - Ldu / Ld) * 100.0;
          SFF = DC;
        }
      }

      if (SFF == none) {
        SFF = 50.0;
        DC = 50.0;
        Ldd = Ld * (DC / 100.0);
        Ldu = Ld * (1.0 - DC / 100.0);
        T0 = 1.0 / L * cnt / 8760.0;
        return [L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF];
      }
    }

    if (Ldu != none && Ldd != none && L != none) {
      if (Ldu + Ldd == L) {
        Lsu = 0.0;
        Lsd = 0.0;
        Ld = L;
        if (SFF != none && DC != none) {
          if (SFF == none) {
            SFF = DC;
          } else {
            DC = SFF;
          }
        }
        if (SFF == none && DC == none) {
          SFF = Ldd / L * 100.0;
          DC = SFF;
        }
        T0 = 1.0 / L * cnt / 8760.0;
        return [L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF];
      }
    }

    if (Ldu != none && Ldd != none && Ld != none) {
      if (Ldu + Ldd == L) {
        Lsu = 0.0;
        Lsd = 0.0;
        L = Ld;
        if (SFF != none && DC != none) {
          if (SFF == none) {
            SFF = DC;
          } else {
            DC = SFF;
          }
        }
        if (SFF == none && DC == none) {
          SFF = Ldd / L * 100.0;
          DC = SFF;
        }
        T0 = 1.0 / L * cnt / 8760.0;
        return [L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF];
      }
    }

    if (Lsu != none && Lsd != none) {
      if (Lsu == 0.0 && Lsd == 0.0) {
        bool fl = true;
        if (SFF != none && DC == none) {
          DC = SFF;
        }
        while (fl) {
          fl = false;
          if (L == none && Ld != none) {
            L = Ld;
            fl = true;
          }
          if (L != none && Ld == none) {
            Ld = L;
            fl = true;
          }
          if (Ldd == none && Ld != none && Ldu != none) {
            Ldd = Ld - Ldu;
            fl = true;
          }
          if (Ldd != none && Ld == none && Ldu != none) {
            Ld = Ldd + Ldu;
            fl = true;
          }
          if (Ldd != none && Ld != none && Ldu == none) {
            Ldu = Ld - Ldd;
            fl = true;
          }
          if (DC != none && L != none) {
            Ldd = Ld * DC / 100.0;
            Ldu = Ld * (1.0 - DC / 100.0);
          }
        }
        if (DC == none) {
          SFF = 50.0;
          DC = 50.0;
          bool fl = true;
          while (fl) {
            fl = false;
            if (L == none && Ld != none) {
              L = Ld;
              fl = true;
            }
            if (L != none && Ld == none) {
              Ld = L;
              fl = true;
            }
            if (Ldd == none && Ld != none && Ldu != none) {
              Ldd = Ld - Ldu;
              fl = true;
            }
            if (Ldd != none && Ld == none && Ldu != none) {
              Ld = Ldd + Ldu;
              fl = true;
            }
            if (Ldd != none && Ld != none && Ldu == none) {
              Ldu = Ld - Ldd;
              fl = true;
            }
            if (DC != none && L != none) {
              Ldd = Ld * DC / 100.0;
              Ldu = Ld * (1.0 - DC / 100.0);
            }
          }
        }
        T0 = 1.0 / L * cnt / 8760.0;
      }
      return [L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF];
    }

    List<double> data = [];

    if (SFF != none) {
      data = calcData(L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF);
    }

    if (SFF == none) {
      SFF = 75.0;
      DC = 50.0;
      data = calcData(L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF);
    }

    return data;
  }

  List<double> calcData(L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF) {
    bool fl = true;
    List<double> data = [];
    while (fl) {
      fl = false;
      if (Lsd != none || Ldd != none) {
        if (Lsd != none) {
          Ldd = Lsd;
        } else {
          Lsd = Ldd;
        }
        fl = true;
      }

      if (L == none) {
        if (Ldu != none && Ldd != none && Lsu != none && Lsd != none) {
          L = Ldu + Ldd + Lsu + Lsd;
        }
        fl = true;
      }
      if (Ldu == none) {
        if (L != none && Ldd != none && Lsu != none && Lsd != none) {
          Ldu = L - Ldd + Lsu + Lsd;
        }
        fl = true;
      }
      if (Lsu == none || Lsd == none || Ldd == none) {
        Lsu = L - (Ldu + Ldd + Lsd);
        fl = true;
      }

      if (Ld != none || L != none) {
        if (Ld == none) {
          Ld = L / 2.0;
        } else {
          L = Ld * 2.0;
        }
        fl = true;
      }

      if (SFF == none) {
        if (L != none && Ldd != none && Lsu != none && Lsd != none) {
          SFF = (Ldd + Lsu + Lsd) / L * 100.0;
        }
        fl = true;
      }
      if (Ldd == none) {
        if (L != none && SFF != none && Lsu != none && Lsd != none) {
          Ldd = (SFF / 100.0 * L - Lsu) / 2.0;
          Lsd = Ldd;
        }
        fl = true;
      }
      if (Lsu == none) {
        if (L != none && SFF != none && Ldd != none && Lsd != none) {
          Lsu = SFF / 100.0 * L - Ldd - SFF;
        }
        fl = true;
      }
      if (Lsd == none || L == none) {
        L = (Ldd + Lsu + Lsd) / SFF;
        fl = true;
      }

      if (SFF != none || DC != none) {
        if (SFF == none) {
          SFF = 50.0 + DC / 2.0;
          if (SFF < 50.0) {
            DC = 0.0;
          }
        } else {
          DC = (SFF - 50.0) * 2.0;
          if (SFF < 50.0) {
            DC = 0.0;
          }
        }
        fl = true;
      }

      if (T0 != none || L != none) {
        if (T0 == none) {
          T0 = 1 / (L * cnt * 8760.0);
        } else {
          L = 1 / (T0 * cnt * 8760.0);
        }
        fl = true;
      }

      if (Ldd == none) {
        Ldd = Ld * DC / 100.0;
        fl = true;
      }
      if (Ld == none) {
        Ld = Ldd * 100.0 / DC;
        fl = true;
      }
      if (DC == none) {
        DC = Ldd * 100.0 / Ld;
        fl = true;
      }

      if (Ldd == none && Ld != none && DC != none) {
        Ldd = Ld * DC / 100.0;
        fl = true;
      }
      if (Ld == none && Ldd != none && DC != none) {
        Ld = Ldd * 100.0 / DC;
        fl = true;
      }
      if (DC == none && Ld != none && Ldd != none) {
        DC = Ldd * 100.0 / Ld;
        fl = true;
      }

      if (Ldu == none && Ld != none && DC != none) {
        Ldu = Ld * (1.0 - DC / 100.0);
        fl = true;
      }
      if (Ld == none && Ldu != none && DC != none) {
        Ld = Ldu / (1.0 - DC / 100.0);
        fl = true;
      }
      if (DC == none && Ld != none && Ldu != none) {
        DC = (1.0 - Ldu / Ld) * 100.0;
        fl = true;
      }

      if (SFF == none) {
        SFF = 75.0;
        DC = 50.0;
        bool fl2 = true;
        while (fl2) {
          fl2 = false;
          if (Lsd != none || Ldd != none) {
            if (Lsd != none) {
              Ldd = Lsd;
            } else {
              Lsd = Ldd;
            }
            fl2 = true;
          }

          if (L == none) {
            if (Ldu != none && Ldd != none && Lsu != none && Lsd != none) {
              L = Ldu + Ldd + Lsu + Lsd;
            }
            fl2 = true;
          }
          if (Ldu == none) {
            if (L != none && Ldd != none && Lsu != none && Lsd != none) {
              Ldu = L - Ldd + Lsu + Lsd;
            }
            fl2 = true;
          }
          if (Lsu == none || Lsd == none || Ldd == none) {
            Lsu = L - (Ldu + Ldd + Lsd);
            fl2 = true;
          }

          if (Ld != none || L != none) {
            if (Ld == none) {
              Ld = L / 2.0;
            } else {
              L = Ld * 2.0;
            }
            fl2 = true;
          }

          if (SFF == none) {
            if (L != none && Ldd != none && Lsu != none && Lsd != none) {
              SFF = (Ldd + Lsu + Lsd) / L * 100.0;
            }
            fl2 = true;
          }
          if (Ldd == none) {
            if (L != none && SFF != none && Lsu != none && Lsd != none) {
              Ldd = (SFF / 100.0 * L - Lsu) / 2.0;
              Lsd = Ldd;
            }
            fl2 = true;
          }
          if (Lsu == none) {
            if (L != none && SFF != none && Ldd != none && Lsd != none) {
              Lsu = SFF / 100.0 * L - Ldd - SFF;
            }
            fl2 = true;
          }
          if (Lsd == none || L == none) {
            L = (Ldd + Lsu + Lsd) / SFF;
            fl2 = true;
          }

          if (SFF != none || DC != none) {
            if (SFF == none) {
              SFF = 50.0 + DC / 2.0;
              if (SFF < 50.0) {
                DC = 0.0;
              }
            } else {
              DC = (SFF - 50.0) * 2.0;
              if (SFF < 50.0) {
                DC = 0.0;
              }
            }
            fl2 = true;
          }

          if (T0 != none || L != none) {
            if (T0 == none) {
              T0 = 1 / (L * cnt * 8760.0);
            } else {
              L = 1 / (T0 * cnt * 8760.0);
            }
            fl2 = true;
          }

          if (Ldd == none) {
            Ldd = Ld * DC / 100.0;
            fl2 = true;
          }
          if (Ld == none) {
            Ld = Ldd * 100.0 / DC;
            fl2 = true;
          }
          if (DC == none) {
            DC = Ldd * 100.0 / Ld;
            fl2 = true;
          }

          if (Ldd == none && Ld != none && DC != none) {
            Ldd = Ld * DC / 100.0;
            fl2 = true;
          }
          if (Ld == none && Ldd != none && DC != none) {
            Ld = Ldd * 100.0 / DC;
            fl2 = true;
          }
          if (DC == none && Ld != none && Ldd != none) {
            DC = Ldd * 100.0 / Ld;
            fl2 = true;
          }

          if (Ldu == none && Ld != none && DC != none) {
            Ldu = Ld * (1.0 - DC / 100.0);
            fl2 = true;
          }
          if (Ld == none && Ldu != none && DC != none) {
            Ld = Ldu / (1.0 - DC / 100.0);
            fl2 = true;
          }
          if (DC == none && Ld != none && Ldu != none) {
            DC = (1.0 - Ldu / Ld) * 100.0;
            fl2 = true;
          }
        }
      }
    }
    data = [L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF];

    return data;
  }

  double pdfAvgMaker(L, Ld, Ldu, Ldd, Lsu, Lsd, T0, T1, DC, SFF) {
    double pdf = none;
    double mrt = 8.0;
    double mttr = 8.0;
    if (Ldu != none && T1 != none && Ldd != none && Lsu != none && Lsd != none) {
      pdf = Ldu * cnt * (T1 * 8760.0 / 2.0 + mrt) + Ldd * cnt * mttr;
    } else if (Ld != none && T1 != none && DC != none) {
      pdf = Ld * cnt * (1.0 - DC / 100.0) * (T1 * 8760.0 / 2.0 + mrt) + Ld * cnt * DC / 100.0 + mttr;
    } else if (L != none && T1 != none && DC != none) {
      pdf = L * cnt / 2.0 * (1.0 - DC / 100.0) * (T1 * 8760.0 / 2.0 + mrt) + (1.0 / (2.0 * T0 * 8760.0)) * DC / 100.0 * mttr;
    } else if (T0 != none && T1 != none && DC != none) {
      pdf = (1.0 / (2.0 * T0 * 8760.0)) * (1.0 - DC / 100.0) * (T1 * 8760.0 / 2.0 + mrt) + (1.0 / (2.0 * T0 * 8760.0)) * DC / 100.0 * mttr;
    }
    return pdf;
  }

}
