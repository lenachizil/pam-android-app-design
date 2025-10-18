import 'course.dart';

class CourseData {
  static final List<Course> allCourses = [
    Course(
      id: 'ui-ux-essentials',
      title: 'UI/UX Design Essentials',
      subtitle: 'Tech Innovations University',
      imagePath: 'assets/img/laptop1.jpg',
      rating: 4.8,
      progress: 0.77,
      price: '\$42',
      description: 'Master the fundamentals of UI/UX design with hands-on projects and real-world applications. This comprehensive course covers user research methodologies, wireframing techniques, prototyping tools, and usability testing. You will learn industry-standard design tools and best practices while working on real-world projects that you can add to your portfolio.',
      lectures: '60+ Lectures',
      learningTime: '6 Weeks',
      certification: 'Online Certificate',
      skills: ['UI Design', 'UX Research', 'Wireframing', 'Prototyping', 'User Testing'],
      studentsEnrolled: '2.4k students already enrolled',
    ),
    Course(
      id: 'graphic-design-fundamentals',
      title: 'Graphic Design Fundamentals',
      subtitle: 'Creative Arts Institute',
      imagePath: 'assets/img/laptop2.jpg',
      rating: 4.5,
      progress: 0.35,
      price: '\$38',
      description: 'Learn the core principles of graphic design including color theory, composition, and visual hierarchy. This course provides a solid foundation in design principles and teaches you how to create stunning visual content for both print and digital media. Master Adobe Creative Suite tools and develop your unique design style.',
      lectures: '45+ Lectures',
      learningTime: '5 Weeks',
      certification: 'Online Certificate',
      skills: ['Color Theory', 'Composition', 'Adobe Creative Suite', 'Visual Hierarchy'],
      studentsEnrolled: '1.8k students already enrolled',
    ),
    Course(
      id: 'typography-layout',
      title: 'Typography and Layout Design',
      subtitle: 'Visual Communication College',
      imagePath: 'assets/img/suggestion1.jpg',
      rating: 4.7,
      price: '\$35',
      description: 'Visual Communication College\'s Typography and Layout Design course explores the art and science of typography and layout composition. Learn how to effectively use typefaces, hierarchy, alignment, and grid systems to create visually compelling designs. Gain hands-on experience in editorial design, branding, and digital layouts.',
      lectures: '50+ Lectures',
      learningTime: '4 Weeks',
      certification: 'Online Certificate',
      skills: ['Typography', 'Layout composition', 'Branding', 'Visual communication', 'Editorial design'],
      studentsEnrolled: '2.4k students already enrolled',
    ),
    Course(
      id: 'branding-identity',
      title: 'Branding and Identity Design',
      subtitle: 'Innovation and Design School',
      imagePath: 'assets/img/suggestion2.jpg',
      rating: 4.4,
      price: '\$40',
      description: 'Create compelling brand identities from concept to execution. Learn logo design, brand guidelines, and strategic thinking. This course teaches you how to develop comprehensive brand identity systems that resonate with target audiences and stand the test of time.',
      lectures: '55+ Lectures',
      learningTime: '5 Weeks',
      certification: 'Online Certificate',
      skills: ['Logo Design', 'Brand Strategy', 'Identity Systems', 'Brand Guidelines'],
      studentsEnrolled: '1.5k students already enrolled',
    ),
    Course(
      id: 'web-design-fundamentals',
      title: 'Web Design Fundamentals',
      subtitle: 'Web Development University',
      imagePath: 'assets/img/suggestion3.jpg',
      rating: 4.9,
      price: '\$45',
      description: 'Master modern web design principles including responsive design, accessibility, and user-centered approaches. Learn to create beautiful, functional websites that work seamlessly across all devices. This course covers HTML, CSS, design systems, and modern web design workflows used by leading companies.',
      lectures: '70+ Lectures',
      learningTime: '8 Weeks',
      certification: 'Online Certificate',
      skills: ['Responsive Design', 'HTML/CSS', 'Web Accessibility', 'User Experience', 'Design Systems', 'Modern Workflows'],
      studentsEnrolled: '3.2k students already enrolled',
    ),
    Course(
      id: 'mobile-app-design',
      title: 'Mobile App Design',
      subtitle: 'App Design Academy',
      imagePath: 'assets/img/suggestion4.jpg',
      rating: 4.6,
      price: '\$48',
      description: 'Design beautiful and functional mobile applications for iOS and Android platforms. Learn platform-specific design guidelines, mobile UI patterns, and how to create intuitive user experiences for mobile devices.',
      lectures: '65+ Lectures',
      learningTime: '7 Weeks',
      certification: 'Online Certificate',
      skills: ['Mobile UI', 'iOS Design', 'Android Design', 'App Prototyping', 'Mobile UX'],
      studentsEnrolled: '2.1k students already enrolled',
    ),
    Course(
      id: 'animation-motion-graphics',
      title: 'Animation and Motion Graphics',
      subtitle: 'Animation Institute of Digital Arts',
      imagePath: 'assets/img/top1.jpg',
      rating: 4.8,
      price: '\$52',
      description: 'Bring your designs to life with animation and motion graphics. Learn After Effects and modern animation techniques. This comprehensive course covers everything from basic animation principles to advanced motion design, preparing you for a career in motion graphics and animation.',
      lectures: '80+ Lectures',
      learningTime: '10 Weeks',
      certification: 'Online Certificate',
      skills: ['After Effects', 'Motion Design', '2D Animation', 'Video Editing', 'Animation Principles'],
      studentsEnrolled: '2.7k students already enrolled',
    ),
    Course(
      id: 'game-design-development',
      title: 'Game Design and Development',
      subtitle: 'Game Development Academy',
      imagePath: 'assets/img/top2.jpg',
      rating: 4.7,
      price: '\$55',
      description: 'Learn the principles of game design, level design, and game mechanics to create engaging gaming experiences. This course teaches you how to design compelling gameplay, create balanced game systems, and build games that players love.',
      lectures: '90+ Lectures',
      learningTime: '12 Weeks',
      certification: 'Online Certificate',
      skills: ['Game Mechanics', 'Level Design', 'Unity', 'Game Theory', 'Player Psychology'],
      studentsEnrolled: '1.9k students already enrolled',
    ),
    Course(
      id: 'product-design-innovation',
      title: 'Product Design and Innovation',
      subtitle: 'Product Design Institute',
      imagePath: 'assets/img/top3.jpg',
      rating: 4.9,
      price: '\$50',
      description: 'Master the product design process from ideation to launch. Learn design thinking and innovation strategies. This course combines creative thinking with practical business strategy to help you design products that solve real problems and delight users.',
      lectures: '75+ Lectures',
      learningTime: '9 Weeks',
      certification: 'Online Certificate',
      skills: ['Design Thinking', 'Product Strategy', 'User Research', 'Innovation', 'Prototyping', 'Market Analysis'],
      studentsEnrolled: '3.5k students already enrolled',
    ),
    Course(
      id: '3d-modeling-basics',
      title: '3D Modeling Basics',
      subtitle: '3D Art School',
      imagePath: 'assets/img/top4.jpg',
      rating: 4.5,
      price: '\$46',
      description: 'Introduction to 3D modeling using industry-standard software. Perfect for beginners.',
      lectures: '55+ Lectures',
      learningTime: '6 Weeks',
      certification: 'Online Certificate',
      skills: ['3D Modeling', 'Blender', 'Texturing', '3D Rendering'],
      studentsEnrolled: '1.6k students already enrolled',
    ),
  ];

  static List<Course> getContinueWatching() {
    return allCourses.where((course) => course.progress != null && course.progress! > 0).toList();
  }

  static List<Course> getSuggestions() {
    return allCourses.where((course) => course.progress == null || course.progress == 0).toList();
  }

  static List<Course> getTopCourses() {
    final topCourses = List<Course>.from(allCourses);
    topCourses.sort((a, b) => b.rating.compareTo(a.rating));
    return topCourses.take(4).toList();
  }

  static Course? getCourseById(String id) {
    try {
      return allCourses.firstWhere((course) => course.id == id);
    } catch (e) {
      return null;
    }
  }
}
