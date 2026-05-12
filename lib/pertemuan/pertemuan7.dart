import 'package:flutter/material.dart';

class RadiobuttonPage extends StatefulWidget {
  const RadiobuttonPage({super.key});

  @override
  State<RadiobuttonPage> createState() => _RadiobuttonPageState();
}

class _RadiobuttonPageState extends State<RadiobuttonPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _umurController = TextEditingController();

  String? _selectedGender;
  String? _selectedJob;
  String? _selectedWorkType;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> _jobOptions = [
    {
      'value': 'Admin',
      'icon': Icons.support_agent,
      'color': Color(0xFF2196F3),
      'description': 'Mengelola data',
    },
    {
      'value': 'Guru',
      'icon': Icons.school,
      'color': Color(0xFF9C27B0),
      'description': 'Mendidik generasi',
    },
    {
      'value': 'Programmer',
      'icon': Icons.code,
      'color': Color(0xFF4CAF50),
      'description': 'Ngoding app',
    },
    {
      'value': 'Pengusaha',
      'icon': Icons.business,
      'color': Color(0xFFFF5722),
      'description': 'Mengelola bisnis',
    },
  ];

  final List<Map<String, dynamic>> _workTypeOptions = [
    {
      'value': 'Full Time',
      'subtitle': '40 jam/minggu',
      'icon': Icons.work,
      'color': Color(0xFF00897B),
      'benefits': ['Gaji tetap', 'Asuransi'],
    },
    {
      'value': 'Part Time',
      'subtitle': '20 jam/minggu',
      'icon': Icons.access_time,
      'color': Color(0xFF0288D1),
      'benefits': ['Fleksibel'],
    },
    {
      'value': 'Freelance',
      'subtitle': 'Remote',
      'icon': Icons.laptop,
      'color': Color(0xFF7B1FA2),
      'benefits': ['WFH', 'Project based'],
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _namaController.dispose();
    _umurController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: const Text("Form Modern"),
        backgroundColor: const Color(0xFF00695C),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// ===== DATA DIRI =====
                _buildSection("Data Diri"),
                _buildModernTextField(
                  controller: _namaController,
                  label: 'Nama',
                  hint: 'Masukkan nama',
                  icon: Icons.person,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Nama wajib' : null,
                ),
                const SizedBox(height: 12),
                _buildModernTextField(
                  controller: _umurController,
                  label: 'Umur',
                  hint: 'Masukkan umur',
                  icon: Icons.cake,
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Umur wajib';
                    final age = int.tryParse(v);
                    if (age == null || age < 17) return 'Minimal 17';
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// ===== GENDER =====
                _buildSection("Jenis Kelamin"),
                Row(
                  children: [
                    Expanded(
                      child: _buildGenderCard(
                        "Laki-laki",
                        Icons.male,
                        Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildGenderCard(
                        "Perempuan",
                        Icons.female,
                        Colors.pink,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// ===== PEKERJAAN =====
                _buildSection("Pekerjaan"),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _jobOptions.map((job) {
                    bool isSelected = _selectedJob == job['value'];

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              job['icon'],
                              color: isSelected ? Colors.white : job['color'],
                            ),
                            const SizedBox(width: 6),
                            Text(job['value']),
                          ],
                        ),
                        selected: isSelected,
                        selectedColor: job['color'],
                        onSelected: (v) {
                          setState(() {
                            _selectedJob = v ? job['value'] : null;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),

                /// ===== TIPE KERJA =====
                _buildSection("Tipe Pekerjaan"),
                Column(
                  children: _workTypeOptions.map((work) {
                    bool isSelected = _selectedWorkType == work['value'];
                    Color c = work['color'];

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? c.withOpacity(0.1) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: isSelected ? c : Colors.grey),
                      ),
                      child: RadioListTile(
                        value: work['value'],
                        groupValue: _selectedWorkType,
                        onChanged: (v) {
                          setState(() {
                            _selectedWorkType = v.toString();
                          });
                        },
                        title: Text(work['value']),
                        subtitle: Text(work['subtitle']),
                        secondary: Icon(work['icon'], color: c),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedGender != null &&
                        _selectedJob != null &&
                        _selectedWorkType != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Berhasil submit")),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ===== COMPONENT =====

  Widget _buildSection(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildGenderCard(String value, IconData icon, Color color) {
    bool selected = _selectedGender == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? color : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Column(
          children: [
            Icon(icon, color: selected ? Colors.white : color),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(color: selected ? Colors.white : color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
