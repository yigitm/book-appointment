# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Course.create(name:'Pilot Courses',info:'General subject ground e-learning courses for pilots.', user_id: User.first.id )
Detail.create(course_id: Course.first.id,course_name:'Windshear', summary: 'This course is an excellent program on the threats of wind shear and turbulence in normal flight operations. This program meets all the requirements for all civil aviation agencies. The course contains the following information: A review of definitions of atmospheric conditions that contribute to wind shear and turbulence. A discussion of Clear Air Turbulence, Microbursts, Gust Fronts, and Terrain-Induced wind shear. Discussions on alerting systems such as Light Detection and Ranging (LIDAR) systems, Low-Level Wind Shear Alerting System (LLWAS), Terminal Doppler Weather Radar (TDWR) and the Microburst Alert (MBA) system. The effects of thunderstorms such as gust fronts and low-level turbulence. A very good review of some of the challenges of flight operations near airports.')
