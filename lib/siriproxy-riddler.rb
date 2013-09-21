require 'cora'
require 'siri_objects'
require 'pp'

class SiriProxy::Plugin::Riddler < SiriProxy::Plugin
  def initialize(config)
end

  listen_for /list riddles/i do
    say "--- mind reading - activate riddle mind reading"

    request_completed 
  end

  listen_for /activate riddle mind reading/i do
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

              newnumber1 = number.to_i - 25 #Subtracts 25 from the complete number
              numb1,numb2 = newnumber1.to_s[0],newnumber1.to_s[1] #Seperates the two numbers into two variables

              say "Your first number was #{numb1}, and your second number was #{numb2}." #Tells you your numbers
            end
          end
        end
      end
    end

    request_completed 
  end

end
