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
                  label: 'Tipo de Patología:',
                  value: model.entity.patologyType,
                  items: Patology.values,
                  onSaved: (value) => model.entity.patologyType = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Trauma Contuso',
                  value: model.entity.bluntTrauma,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.bluntTrauma = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Trauma Penetrante',
                  value: model.entity.penetratingTrauma,
                  items: InjuredEye.values,
                  onSaved: (value) => model.entity.penetratingTrauma = value
              ),
              _enumInput<InjuredEye>(
                  label: 'Dis Agudeza visual',
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
        width: double.infinity,
        child: TextFormField(
          initialValue: value,
          onSaved: (value) => onSaved.call(value),
          validator: (value) => validator != null && !validator.call(value) ? 'Campo Obligatorio' : null,
          decoration: InputDecoration(
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
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(width: 0.5, color: Colors.white)),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TextStyle(color: Colors.white, fontSize: 18),),
                DropdownButton<T>(
                  value: value,
                  dropdownColor: ColorStyles.appbarprimarycolor,
                  hint: Text('Seleccione uno:', style: TextStyle(color: Colors.white),),
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
