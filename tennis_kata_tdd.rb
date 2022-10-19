# 1.first play to win at least 4 points in total 
# and at least 2 points more than oppenent
# 2.Scores 0 - 3 points are "love", "fifteen", "thirty", and "forty"
# 3.If at least 3 point scored by each and it's equal, then "deuce"
# 4.If at least 3 points scored by each and play has 1 more point, 
# score is "advantage" for lead player


class TennisScorer
    def initialize
        @score = 'Love'
    end

    def won_point

        if @score == 'Love'
            @score = 'Fifteen'
        elsif @score == 'Thirty'
            @score = "Forty"
        else
            @score = "Thirty"
        end
    end

    def score
        (@score) + "-Love"
    end
end

describe TennisScorer do
    let(:tennis_score) { TennisScorer.new }
    it 'can score a new game where no player has scored yet' do
        expect(tennis_score.score).to eq('Love-Love')
    end

    it 'can score a new game where player one has scored once' do
        tennis_score.won_point
        expect(tennis_score.score).to eq('Fifteen-Love')
    end

    it 'can score a new game where player one has scored twice' do
        2.times { tennis_score.won_point }
        expect(tennis_score.score).to eq('Thirty-Love')
    end

    it 'can score a new game where player one has scored thrice' do
        3.times { tennis_score.won_point }
        expect(tennis_score.score).to eq('Forty-Love')
    end

end