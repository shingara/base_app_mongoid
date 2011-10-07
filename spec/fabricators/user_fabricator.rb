Fabricator(:user) do
  login { /\w+/.gen }
  email { /[:email:]/.gen }
  password 'tintinpouet'
  password_confirmation 'tintinpouet'
end
