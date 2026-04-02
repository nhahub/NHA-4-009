import 'package:flutter/material.dart';
import 'package:moodly/features/settings/presentation/widgets/profile/custom_text_field.dart';


class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=3",
              ),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {},
              child: const Text("Change Picture"),
            ),

            const SizedBox(height: 20),

            const CustomTextField(label: "Name", hint: "John"),
            const SizedBox(height: 15),

            const CustomTextField(label: "Email", hint: "Johndoe@email.com"),
            const SizedBox(height: 15),

            const CustomTextField(
              label: "Phone Number",
              hint: "(+1) 234 567 890",
              icon: Icons.phone,
            ),
            const SizedBox(height: 15),

            const CustomTextField(
              label: "Password",
              hint: "******",
              isPassword: true,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}