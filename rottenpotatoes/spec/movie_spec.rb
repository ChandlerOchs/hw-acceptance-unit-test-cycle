require 'rails_helper'
describe Movie do
    
    it 'should find a movie with exact same director' do
        kk = Movie.create(title: 'KingKong', director: 'Peter Jackson')
        lotr = Movie.create(title: 'Lord of the Rings', director: 'Peter Jackson')
        expect(Movie.similar_movies(kk.id)).to eq([kk, lotr])
    end
    
    it 'should find all movies with the exact same director' do
        kk = Movie.create(title: 'KingKong', director: 'Peter Jackson')
        lotr = Movie.create(title: 'Lord of the Rings', director: 'Peter Jackson')
        me = Movie.create(title: 'Mortal Engines', director: 'Peter Jackson')
        expect(Movie.similar_movies(kk.id)).to eq([kk, lotr, me])
    end
    
    
    it 'should find movies with case sensitive director' do
        kk = Movie.create(title: 'KingKong', director: 'PeTeR JacKson')
        lotr = Movie.create(title: 'Lord of the Rings', director: 'Peter Jackson')
        me = Movie.create(title: 'Mortal Engines', director: 'Peter Jackson')
        expect(Movie.similar_movies(lotr.id)).to eq([lotr, me])
    end
    
    

    it 'should return nil if unable to find another movie with the same director' do
        ocs = Movie.create(title: 'Overworked CS Student')
        expect(Movie.similar_movies(ocs.id)).to eq(nil)
    end
end 