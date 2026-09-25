/// Static content of the portfolio, kept in one place so pages stay layout-only.
class Profile {
  static const String name = 'Olek Mehl';
  static const String role = 'Flutter Developer';
  static const String tagline =
      'I build fast, secure and good looking apps that run on mobile, web and desktop from a single codebase.';
  static const String email = 'olekmehl@gmail.com';
  static const String phone = '+49 176 236 76 121';
  static const String location = 'Beethovenstr. 18, Vellmar';
  static const String github = 'https://github.com/settlerde';
  static const String instagram = 'https://www.instagram.com/';
  static const String avatar = 'assets/20260416_cdemy_DSC_1377_Lebenslauf.jpg';
  static const String avatarAlt = 'assets/20260416_cdemy_DSC_1378_Lebenslauf.jpg';

  static const List<String> skills = <String>[
    'Flutter',
    'Dart',
    'Firebase',
    'Android',
    'iOS',
    'Web',
    'Windows',
    'REST APIs',
  ];
}

class Service {
  const Service({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;
}

const List<Service> services = <Service>[
  Service(
    title: 'Web development',
    description: 'Responsive web apps that load fast and look sharp on every screen size.',
    imagePath: 'assets/web.jpg',
  ),
  Service(
    title: 'App development',
    description: 'One Flutter codebase shipped to Android and iOS, with native feel on both.',
    imagePath: 'assets/app.png',
  ),
  Service(
    title: 'Back-end development',
    description: 'Firebase auth, Firestore, storage and hosting wired up end to end.',
    imagePath: 'assets/firebase.png',
  ),
];

class Project {
  const Project({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.tags,
    this.url,
  });

  final String title;
  final String description;
  final String imagePath;
  final List<String> tags;
  final String? url;
}

const List<Project> projects = <Project>[
  Project(
    title: 'Portfolio website',
    description: 'This site: a responsive Flutter web app deployed on Firebase Hosting.',
    imagePath: 'assets/web.jpg',
    tags: <String>['Flutter Web', 'Firebase'],
    url: 'https://github.com/settlerde/olek_udemy_portfolio',
  ),
  Project(
    title: 'Calendar app',
    description: 'A calendar built first in plain HTML/CSS/JS and then rewritten in Flutter.',
    imagePath: 'assets/blog.jpg',
    tags: <String>['Flutter', 'JavaScript'],
    url: 'https://github.com/settlerde/flutter_kalender_app',
  ),
  Project(
    title: 'Shop client',
    description: 'Dart client for an online shop API with product list, cart and checkout flow.',
    imagePath: 'assets/works.jpg',
    tags: <String>['Dart', 'REST API'],
    url: 'https://github.com/settlerde/dart_shop_client',
  ),
  Project(
    title: 'To-do manager',
    description: 'Task manager with JSON persistence, priorities and quadrant based sorting.',
    imagePath: 'assets/app.png',
    tags: <String>['Dart', 'JSON'],
    url: 'https://github.com/settlerde/projekt_todo_tojson',
  ),
];
