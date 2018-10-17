namespace :votes do

  desc "Resets cached_votes_up counter to its latest value"
  task reset_vote_counter: :environment do
    models = [Proposal, Budget::Investment]

    models.each do |model|
      model.find_each do |resource|
        resource.update_cached_votes
        print "."
      end
    end
  end

  desc "Delete existing votes"
  task delete_existing_votes: :environment do
    models = [Poll::Answer, Poll::Voter]

    models.each do |model|
      model.delete_all
    end
  end

end
