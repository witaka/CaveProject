PASSWORD = "password"

# User.destroy_all
Answer.destroy_all
Question.destroy_all
Quiz.destroy_all

12.times.each do 
  quiz = Quiz.create(
    title: Faker::Hobbit.character,
    points: rand(1..3)*500,
    passmark: rand(50..100)
  )

  if quiz.valid?
    rand(2..4).times.each do
      question = Question.create(
        body: Faker::TwinPeaks.quote,
        quiz: quiz
        )
      
      if question.valid?
        answer = Answer.create(
            body: Faker::RockBand.name,
            question: question,
            correct: true
        )
        3.times.each do
          answer = Answer.create(
            body: Faker::Space.star,
            question: question,
            correct: false
          )
        end
      end
    end


  end

end

# 15.times.each do
    
#         first_name = Faker::Name.first_name
#         last_name = Faker::Name.last_name
      
#         User.create(
#         first_name: first_name,
#         last_name: last_name,
#         email:"#{first_name.downcase}.#{last_name.downcase}@nasa.gov",
#         password: PASSWORD,
#         admin: false,
#         pts: rand(0..30)*500,
#         approved: true
#     )
end
#users = User.all
quizzes = Quiz.all
questions = Question.all
answers = Answer.all

puts  "Created #{quizzes.count} quizzes"
puts  "Created #{questions.count} questions"
puts  "Created #{answers.count} answers"


