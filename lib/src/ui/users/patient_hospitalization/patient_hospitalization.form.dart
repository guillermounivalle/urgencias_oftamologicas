import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/view.model.consumer.dart';
import 'package:urgencias_oftamologicas/src/repository/utils/dateutils.util.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_hospitalization/patient_hospitalization.view.model.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_hospitalization/model/patienthospitalization.enum.dart';
import '../../../repository/styles/color.styles.dart';

class PatientHospitalizationForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PatientHospitalizationForm({required this.formKey, Key? key}) : super(key: key);

  @override
  State<PatientHospitalizationForm> createState() => _PatientHospitalizationFormState();
}

class _PatientHospitalizationFormState extends State<PatientHospitalizationForm> {
  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<PatientHospitalizationViewModel>(
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
              _enumInput<HospitalizationDays>(
                  label: 'Días de \nhospitalización:',
                  value: model.entity.hospitalizationDays,
                  items: HospitalizationDays.values,
                  onSaved: (value) => model.entity.hospitalizationDays = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Antibióticos',
                  value: model.entity.receivedAntibiotics,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.receivedAntibiotics = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Anti-inflamatorios',
                  value: model.entity.receivedAntiinflmatories,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.receivedAntiinflmatories = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Hipertensores \nOculares',
                  value: model.entity.receivedOcularhypotensives,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.receivedOcularhypotensives = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Lubricantes',
                  value: model.entity.receivedLubricants,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.receivedLubricants = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Antiagiogénicos',
                  value: model.entity.receivedAntiasgiogenics,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.receivedAntiasgiogenics = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Interconsulta a \nSupraespecialidad',
                  value: model.entity.receivedAntiasgiogenics,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.receivedAntiasgiogenics = value
              ),
              _enumInput<VisualAcuity>(
                  label: 'Agudeza Visual\n al salir',
                  value: model.entity.visualAcuitytoleaving,
                  items: VisualAcuity.values,
                  onSaved: (value) => model.entity.visualAcuitytoleaving = value
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
        key: UniqueKey(),
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