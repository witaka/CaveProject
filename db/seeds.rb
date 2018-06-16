
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
quizzes = Quiz.all
questions = Question.all
answers = Answer.all

puts  "Created #{quizzes.count} quizzes", :dragon
puts  "Created #{questions.count} questions", :frogs
puts  "Created #{answers.count} answers", :sheep


