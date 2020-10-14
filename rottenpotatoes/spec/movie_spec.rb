require 'rails_helper'
describe Movie do
    describe '.similar_movies' do
        # movie1 = Movie.create(title: 'King Kong', director: 'Peter Jackson')
        # movie2 = Movie.create(title: 'Lord of the Rings', director: 'Peter Jackson') 
        # movie3 = Movie.create(title: 'Kangaroo Jack', director: 'David McNally')
        # movie4 = Movie.create(title: 'Overworked CS Student')
        #Added these movies in, but I found that every time I ran rspec, it was creating a new movie
        #so this was my ducttape fix
        movie1 = Movie.where(title: 'King Kong')[0]
        movie2 = Movie.where(title: 'Lord of the Rings')[0] 
        movie3 = Movie.where(title: 'Kangaroo Jack')[0]
        movie4 = Movie.where(title: 'Overworked CS Student')[0]

        context 'move has a director' do
            it 'finds similar movies based on director' do
                expect(Movie.similar_movies(movie1.id)).to eq([movie1, movie2])
            end
            it 'doesnt find movies by different directors' do
                expect(Movie.similar_movies(movie1.id)).to_not include([movie3, movie4])
            end
        end
        context 'movie does not have a director' do
            it 'defaults to nill (sad path)' do
                expect(Movie.similar_movies(movie4.id)).to eq(nil)
            end
        end
    end
end 