module SubmissionsHelper
	def avgRankGap(assignment_id, student_id)
		@sumDif = 0.0
		@rankings = Ranking.where(user_id: student_id, translation_id: Translation.where(assignment_id: assignment_id))
		@rankings.each do |rank|
			@sumDif = @sumDif + (Submission.where(translation_id: rank.translation_id).first.grade - rank.rank)
		end
		if @rankings.count == 0.0
			return 'N/A'
		else
		return @sumDif/@rankings.count
	end
	end

	def avgTranslation(student_id)
		@count = 0.0
		@grade = 0.0
		Assignment.all.each do |assignment|
			if Submission.exists?(assignment_id: assignment.id, user_id: student_id)
				@grade = @grade + Submission.where(assignment_id: assignment.id, user_id: student_id).first.grade
				@count = @count + 1
			end
		end
		if @count == 0
			return 'N/A'
		else 
			return @grade/@count
		end
	end

	def avgAvgRankGap(student_id)
		@averages = 0.0
		@count = 0.0
		Assignment.all.each do |assignment|
			if avgRankGap(assignment.id, student_id) >= -4 && avgRankGap(assignment.id, student_id) <= 4
				@averages = @averages + avgRankGap(assignment.id, student_id)
				@count = @count + 1
			end
		end
		if @count == 0.0
			return 'N/A'
		else 
			return @averages/@count
		end
	end
end
