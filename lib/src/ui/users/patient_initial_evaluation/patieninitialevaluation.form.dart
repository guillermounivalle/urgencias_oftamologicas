import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/view.model.consumer.dart';
import 'package:urgencias_oftamologicas/src/repository/utils/dateutils.util.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_initial_evaluation/patientinitialevaluation.view.model.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation/model/patientinitialevaluation.enum.dart';

import '../../../repository/styles/color.styles.dart';

class PatientInitialEvaluationForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PatientInitialEvaluationForm({required this.formKey, Key? key}) : super(key: key);

  @override
  State<PatientInitialEvaluationForm> createState() => _PatientInitialEvaluationFormState();
}

class _PatientInitialEvaluationFormState extends State<PatientInitialEvaluationForm> {
  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<PatientInitialEvaluationViewModel>(
        builder: (context, model, _) {
          return Column(
            children: [
              _textInput(
                  label: 'Documento de Identidad:',
                  value: model.entity.documentId,
                  onSaved: (value) => model.entity.documentId = value,
                  validator: (value) => value != null && value != '',
                  keyboard: TextInputType.number
              ),
              _calendarInput(
                label: 'Fecha de Consulta:',
                value: model.entity.consultationDate,
                onSaved: (value) => model.entity.consultationDate = value,
              ),
              _enumInput<Patology>(
                  label: 'Tipo de\nPatología:',
                  value: model.entity.patologyType,
                  items: Patology.values,
                  onSaved: (value) => model.entity.patologyType = value
              ),
              _textLabel(
                  label: 'Motivo de consulta',
              ),
              _enumInput<InjuredEye>(
                  label: 'Trauma\nContuso',
                  value: model.entity.bluntTrauma,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.bluntTrauma = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Trauma\nPenetrante',
                  value: model.entity.penetratingTrauma,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.penetratingTrauma = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Disminución\nAgudeza Visual',
                  value: model.entity.decreasedVisualAcuity,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.decreasedVisualAcuity = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Dolor Ocular',
                  value: model.entity.eyePain,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.eyePain = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Ojo Rojo',
                  value: model.entity.redEye,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.redEye = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Conjuntivitis',
                  value: model.entity.conjunctivitis,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.conjunctivitis = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Queratitis',
                  value: model.entity.keratitis,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.keratitis = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Lesión en\nparpado',
                  value: model.entity.eyelidInjury,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.eyelidInjury = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Lesión en\nlagrimal',
                  value: model.entity.tearductyInjury,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.tearductyInjury = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Cefálea',
                  value: model.entity.headache,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.headache = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Transtorno\nrefractivo',
                  value: model.entity.tearductyInjury,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.tearductyInjury = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Tumor(es)',
                  value: model.entity.tumors,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.tumors = value
              ),
              _textInput(
                  label: 'Otras Alteraciones:',
                  value: model.entity.otherAlterations,
                  onSaved: (value) => model.entity.otherAlterations = value,
                  validator: (value) => value != null && value != '',
                  keyboard: TextInputType.text,
              ),
              _textLabel(
                label: 'Sintomas de Consulta',
              ),
              _enumInput<InjuredEye>(
                  label: 'Visión Borrosa',
                  value: model.entity.blurredVision,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.blurredVision = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Cuerpo extraño\nen ojo',
                  value: model.entity.strangeBody,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.strangeBody = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Dolor Ocular',
                  value: model.entity.eyePain,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.eyePain = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Lagrimeo',
                  value: model.entity.tearing,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.tearing = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Secreción',
                  value: model.entity.secretion,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.secretion = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Fotofobía',
                  value: model.entity.photophobia,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.photophobia = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Cefálea',
                  value: model.entity.headache,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.headache = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Diplopía',
                  value: model.entity.diplopia,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.diplopia = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Fotopsias',
                  value: model.entity.photopsia,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.photopsia = value
              ),
              _textInput(
                label: 'Otro Sintoma:',
                value: model.entity.otherAlterations,
                onSaved: (value) => model.entity.otherAlterations = value,
                validator: (value) => value != null && value != '',
                keyboard: TextInputType.text,
              ),
              _textLabel(
                label: 'Agudeza Visual al Ingerso',
              ),
              _enumInput<VisualAcuity>(
                  label: 'Agudeza Visual',
                  value: model.entity.visualAcuity,
                  items: VisualAcuity.values,
                  onSaved: (value) => model.entity.visualAcuity = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Cuenta dedos?',
                  value: model.entity.fingersCount,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.fingersCount = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Sigue Movimiento\nde manos?',
                  value: model.entity.handMovement,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.handMovement = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Percepciòn de Luz',
                  value: model.entity.lightPerception,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.lightPerception = value
              ),
              _textLabel(
                label: 'Hallazgos del exámen realizado',
              ),
              _enumInput<InjuredEye>(
                  label: 'Hiperermia',
                  value: model.entity.hyperemia,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.hyperemia = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Inyección\nConjuntival',
                  value: model.entity.conjuctivalInjection,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.conjuctivalInjection = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Edema u \nOpacidad Corneal',
                  value: model.entity.cornealOpacity,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.cornealOpacity = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Alteraciones de la\nCamara Anterior',
                  value: model.entity.anteriorChamberAlterations,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.anteriorChamberAlterations = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Presencia o no\npresencia de Flare',
                  value: model.entity.flarePresence,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.flarePresence = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Presencia o no\npresencia de CA',
                  value: model.entity.celurityPresenceCA,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.celurityPresenceCA = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Alteraciones\ndel Iris',
                  value: model.entity.irisAlteration,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.irisAlteration = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Alteraciones\ndel Cristalino',
                  value: model.entity.lensAlteration,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.lensAlteration = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Presión Intraocular\nelevada',
                  value: model.entity.elevatedIntraocularPressure,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.elevatedIntraocularPressure = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Fondo de ojo\nanormal',
                  value: model.entity.abnormalFondus,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.abnormalFondus = value
              ),
            ],
          );
        }
    );
  }

  Widget _textInput({required String label,
    required String? value,
    required Function(String? value) onSaved,
    bool Function(String? value)? validator,
    TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: TextFormField(
          scrollPhysics: null,
          maxLines: 5,
          initialValue: value,
          onSaved: (value) => onSaved.call(value),
          validator: (value) => validator != null && !validator.call(value) ? 'Campo Obligatorio' : null,
          decoration: InputDecoration(
            hintText: 'Escriba aquí',
            hintStyle: TextStyle(color: Colors.white70),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.5)
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.white),
          ),
          keyboardType: keyboard,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  Widget _textLabel({required String label,
    }) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: TextField(
          enableInteractiveSelection: false,
          enabled: false,
          decoration: InputDecoration(
          filled: true,
          fillColor: ColorStyles.appbarprimarycolor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.5)
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 5,
              fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _calendarInput({required String label,
    DateTime? value,
    required Function(DateTime? value) onSaved,
    bool Function(String? value)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        readOnly: true,
        style: TextStyle(color: Colors.white),
        initialValue: value != null ? OFTDateUtils.format(value) : null,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.5)
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.white,)
        ),
        validator: (value) => validator != null && !validator.call(value) ? 'Valor Obligatorio.' : null,
        onTap: () => showDatePicker(
            context: context,
            initialDate: value != null ? value : DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now()
        ).then((value) => setState((){
          onSaved.call(value);
          widget.formKey.currentState!.save();
        })),
      ),
    );
  }

  Widget _enumInput<T extends OFTJsonEnum>({required String label,
    required T? value, required List<T> items, required Function(T? value) onSaved}) {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(width: 0.5, color: Colors.white)),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TextStyle(color: Colors.white, fontSize: 18),),
                DropdownButton<T>(
                  value: value,
                  dropdownColor: ColorStyles.appbarprimarycolor,
                  hint: Text('Seleccione uno:', style: TextStyle(color: Colors.white70),),
                  items: items.map((e) =>
                      DropdownMenuItem(
                          value: e,
                          child: Text(e.getValue(),
                          style: TextStyle(color: Colors.white),)
                      )
                  ).toList(),
                  onChanged: (value) => setState(() => onSaved.call(value)),
                ),
              ],
            ),
          ),
        )
    );
  }
  
}
