require 'cora'
require 'siri_objects'
require 'pp'

class SiriProxy::Plugin::Riddler < SiriProxy::Plugin
  def initialize(config)
end

  listen_for /list riddles/i do
    say "1. Two Numbers - activate riddle two numbers \r\n 2. Equals Three - activate riddle equals three \r\n 3. Three Numbers - activate riddle three numbers"

    request_completed 
  end

  listen_for /activate riddle two numbers/i do
    say "Each time you finish a step, say 'next'"
    response = ask "Think of any number 0 through 9."
    if(response =~ /next/i)
      response2 = ask "Now double your number."
      if(response2 =~ /next/i)
        response3 = ask "Add five to your new number."
        if(response3 =~ /next/i)
          response4 = ask "Now multiply the answer by 5."
          if(response4 =~ /next/i)
            response5 = ask "Pick another number 0 through 9 and add it to your new number."
            if(response5 =~ /next/i)
              number = ask "Tell me what your completed number is."

              newnumber1 = number.to_i - 25
              numb1,numb2 = newnumber1.to_s[0],newnumber1.to_s[1]

              say "Your first number was #{numb1}, and your second number was #{numb2}."
            end
          end
        end
      end
    end

    request_completed 
  end

  listen_for /activate riddle three numbers/i do
    say "Each time you finish a step, say 'next'"
    response = ask "Think of any 3 digit number, but each of the digits must be the same as. Ex: 333, 666."
    if(response =~ /next/i)
      response2 = ask "Add up the digits."
      if(response2 =~ /next/i)
        response3 = ask "Divide the 3 digit number with the digits added up."
        if(response3 =~ /next/i)
          say "Your final number is 37."
        end
      end
    end

    request_completed 
  end

  listen_for /activate riddle equals three/i do
    say "Each time you finish a step, say 'next'"
    response = ask "Think of any number 0 through 9."
    if(response =~ /next/i)
      response2 = ask "Now double your number."
      if(response2 =~ /next/i)
        response3 = ask "Add six to your new number."
        if(response3 =~ /next/i)
          response4 = ask "Now divide the answer by 2."
          if(response4 =~ /next/i)
            response5 = ask "Now subtract the number you started with from your new total"
            if(response5 =~ /next/i)
              say "Your final number is 3."
            end
          end
        end
      end
    end

    request_completed 
  end

end
