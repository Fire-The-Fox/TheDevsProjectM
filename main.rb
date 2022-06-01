require "discordrb"

bot = Discordrb::Bot.new token: "OTgxNDcwNDA4ODc4NDgxNDE4.GgLYx8.lBQNALaBww4Z4TxRe3y9YOpHEM95G31T12aSUI", intents: [:server_messages]

bot.message(start_with: "$submit") do |event|
  channelID = 981469946607468574
  args = []
  unless (event.message.content.count('"') == 4)
    return
  end
  tmp = ""
  add = false
  args.shift

  embed = Discordrb::Webhooks::Embed.new(
    title: args[0],
    color: 0x00ff00
  )

  args.shift

  embed.description = args.join(" ")

  voteMsg = bot.channel(channelID).send_message("", false, embed)

  voteMsg.react "✅"
  voteMsg.react "❎"

  event.message.react "👍"

end

bot.run