import 'package:flutter/material.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _placeNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(178, 226, 163, 238),
        title: const Text('Reservas'),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 234, 234),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _placeNameController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Espaço',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do espaço';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'Nome de Usuário',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome de usuário';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_startTime == null
                      ? 'Horário de Início: Não selecionado'
                      : 'Horário de Início: ${_startTime!.format(context)}'),
                  ElevatedButton(
                    onPressed: () => _selectTime(context, true),
                    child: const Text('Selecionar'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_endTime == null
                      ? 'Horário de Término: Não selecionado'
                      : 'Horário de Término: ${_endTime!.format(context)}'),
                  ElevatedButton(
                    onPressed: () => _selectTime(context, false),
                    child: const Text('Selecionar'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_startTime == null || _endTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, selecione os horários.'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Reserva feita com sucesso!'),
                          ),
                        );
                        
                      }
                    }
                  },
                  child: const Text('Confirmar Reserva'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _placeNameController.dispose();
    _userNameController.dispose();
    super.dispose();
  }
}
