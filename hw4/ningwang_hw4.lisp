(in-microtheory KRR-Winter2020RulesMt)

;;; 0)
;;; "Tuesday and Thursday from 2:00 to 8:00",
;;; "Tuesday and Thursday from 11:00 to 12:20"
(<== (courseTaughtTime ?person ?time)
     (courseInstructor ?course ?person)
     (courseTimeString ?course ?time))


;;; 1)
;;; jrw@northwestern.edu
(<== (emailOfCourseInstructor ?course ?email)
     (courseInstructor ?course ?instructor)
     (emailOf ?instructor ?email))

;;; 2)
;;; BrentHecht
;;; GokhanMemik
(<== (degreeEarnedAt ?person ?institution)
     (isa ?person NUFaculty)
     (schooling ?person ?institution PhD)
     (schooling ?person ?institution MS)
     (isa ?institution DegreeGrantingHigherEducationInstitution))

;;; 3)
;;; BrownUniversity
;;; CarnegieMellonUniversity
;;; ColumbiaUniversity
;;; GeorgiaInstitutionofTechnology
;;; MassachusettsInstitutionofTechnology
;;; PolitecnicodiMilano
;;; PrincetonUniversity
;;; RiceUniversity
;;; StanfordUniversity
;;; TuftsUniversity
;;; UniversityofMichigan
;;; UniversityofSouthernCalifornia
;;; UniversityofWashington
;;; YaleUniversity
(<== (phdInstitutionsByQuarterTaught ?quarter ?institution)
     (courseTerm ?course ?quarter)
     (courseInstructor ?course ?instructor)
     (schooling ?instructor ?institution PhD)
     (isa ?institution DegreeGrantingHigherEducationInstitution))


;;; 4)
;;; ChrisRiesbeck
;;; HanLiu
;;; JesseTov
;;; SarahVanWart
;;; VincentSt-Amour
;;; YanChen
(<== (teachesMultiple ?instructor ?quarter)
     (courseTerm ?course1 ?quarter)
     (courseInstructor ?course1 ?instructor)
     (courseTerm ?course2 ?quarter)
     (courseInstructor ?course2 ?instructor)
     (different ?course1 ?course2))

;;; 5)
;;; MassachusettsInstitutionofTechnology
;;; PrincetonUniversity
;;; StanfordUniversity
;;; TuftsUniversity
(<== (educationOfTeachersOfMultiple ?university ?quarter)
     (teachesMultiple ?instructor ?quarter)
     (schooling ?instructor ?university PhD)
     (isa ?university DegreeGrantingHigherEducationInstitution))

;;; 6)
;;; Design & Analysis of Algorithms
;;; Human Computer Interaction
;;; Introduction to Artificial Intelligence
;;; Introduction to Computer Systems
(<== (taughtMultiple ?courseName ?year)
     (taughtSame ?courseName ?year)
     (taughtDifferent ?courseName ?year))

(<== (taughtSame ?courseName ?year)
     (courseName ?course ?courseName)
     (courseName ?course2 ?courseName2)
     (equals ?courseName ?courseName2)
     (different ?course ?course2 CS396-Winter2019 CS396-Spring2019 CS396-Fall2019))

(<== (taughtDifferent ?courseName ?year)
     (courseName ?course ?courseName)
     (courseName ?course2 ?courseName2)
     (equals ?courseName ?courseName2)
     (courseName ?course3 ?courseName3)
     (equals ?courseName ?courseName3)
     (courseInstructor ?course ?instructor)
     (courseInstructor ?course2 ?instructor2)
     (courseInstructor ?course3 ?instructor3)
     (different ?instructor ?instructor2 ?instructor3)
     (different ?course ?course2 ?course3 CS396-Winter2019 CS396-Spring2019 CS396-Fall2019))
