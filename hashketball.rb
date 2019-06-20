
def game_hash
  {
    
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        { :name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, 
        {
          :name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        { 
          :name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        { 
          :name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }]
    },
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        { 
          :name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        { :name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }]
    }
   } 
  end



def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      return player[:points] if player[:name] == player_name
    end
  end
end   


def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      return player[:shoe] if player[:name] == player_name
    end
  end
end   


def team_colors(team)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == team
  end
end


def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams.push(team_data[:team_name])
  end 
  return teams 
end


def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team 
      team_data[:players].each do |player|
        jersey_numbers.push(player[:number])
      end  
    end
  end
  return jersey_numbers
end


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      return player.select {|k| k != :name} if player[:name] == player_name
    end
  end
end


def big_shoe_rebounds 
  all_players = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      all_players[player[:rebounds]] = player[:shoe]
    end
  end
  all_players.select {|rebounds, shoe| return rebounds if shoe == all_players.values.max }
end
  
  
def most_points_scored
  all_players_with_points = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      all_players_with_points[player[:name]] = player[:points]
    end
  end
  all_players_with_points.select {|name, points| return name if points == all_players_with_points.values.max }
end


def player_with_longest_name 
  all_players_names = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      all_players_names[player[:name]] = player[:name].length
    end
  end
  all_players_names.select {|name, length| return name if length == all_players_names.values.max }
end


def winning_team
  teams_scores = {}
  game_hash.each do |location, team_data|
    teams_scores[team_data[:team_name]] = 0
    team_data[:players].each do |player|
      teams_scores[team_data[:team_name]] += player[:points]
    end 
  end
   teams_scores.select {|name, score| return name if score == teams_scores.values.max }
end


 def long_name_steals_a_ton?
  all_players_steals = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      all_players_steals[player[:name]] = player[:steals]
    end
  end
  
  player_max_steals = nil
  all_players_steals.select {|name, steals| player_max_steals = name if steals == all_players_steals.values.max }

  return true if player_max_steals == player_with_longest_name
end

  