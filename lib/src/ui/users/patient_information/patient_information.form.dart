import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/view.model.consumer.dart';
import 'package:urgencias_oftamologicas/src/repository/utils/dateutils.util.dart';

import 'package:urgencias_oftamologicas/src/domain/patient/model/patient.enum.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_information/patient_information.view.model.dart';

import '../../../repository/styles/color.styles.dart';

class PatientForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PatientForm({required this.formKey, Key? key}) : super(key: key);

  @override
  State<PatientForm> createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<PatientViewModel>(
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
              _textInput(
                  label: 'Nombre:',
                  value: model.entity.name,
                  onSaved: (value) => model.entity.name = value,
                  validator: (value) => value != null && value != ''
              ),
              _textInput(
                  label: 'Apellido:',
                  value: model.entity.lastname,
                  onSaved: (value) => model.entity.lastname = value
              ),
              _calendarInput(
                  label: 'Fecha de Nacimiento:',
                  value: model.entity.birthdate,
                  onSaved: (value) => model.entity.birthdate = value,
              ),
              _enumInput<Gender>(
                  label: 'Genero:',
                  value: model.entity.gender,
                  items: Gender.values,
                  onSaved: (value) => model.entity.gender = value
              ),
              _enumInput<Scholarship>(
                  label: 'Escolaridad:',
                  value: model.entity.schooling,
                  items: Scholarship.values,
                  onSaved: (value) => model.entity.schooling = value
              ),
              _enumInput<Provenance>(
                  label: 'Procedencia:',
                  value: model.entity.source,
                  items: Provenance.values,
                  onSaved: (value) => model.entity.source = value
              ),
              _enumInput<EconomicStratum>(
                  label: 'Estrato:',
                  value: model.entity.socioeconomic,
                  items: EconomicStratum.values,
                  onSaved: (value) => model.entity.socioeconomic = value
              ),
              _calendarInput(
                label: 'Fecha de Consulta:',
                value: model.entity.consultationDate,
                onSaved: (value) => model.entity.consultationDate = value,
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
        key: UniqueKey(),
        onTap: () => showDatePicker(
            context: context,
            initialDate: value != null ? value : DateTime.now(),
            firstDate: DateTime(1900),
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
          height: 60,
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
