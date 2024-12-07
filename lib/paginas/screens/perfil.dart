import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              const SizedBox(height: 10),
              const Text(
                "Usuario",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "guest@domain.com",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              _buildProfileOption(
                icon: Icons.edit,
                title: 'Edit profile information',
                onTap: () {},
              ),
              _buildProfileOption(
                icon: Icons.language,
                title: 'Language',
                trailing: const Text('English'),
                onTap: () {},
              ),
              _buildProfileOption(
                icon: Icons.brightness_6,
                title: 'Theme',
                trailing: const Text('Light mode'),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
