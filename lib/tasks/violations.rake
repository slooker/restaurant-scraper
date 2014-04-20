namespace :violations do
  desc "Parse violations from violations.txt"

  task :parse => :environment do
    parse_violations
  end
end

def parse_violations
  file = File.new("lib/tasks/violations.txt", "r")
  while (line = file.gets)
    myArray = line.split('\'')
    description = myArray[3]
  
    myArray = line.split(',')
    id = myArray[0]
    id.gsub!(/\D/, '')
    code = myArray[1]
    code.gsub!("'",'')
    code.gsub!(/\s/,'')
    demerits = myArray[3]

    puts "ID: #{id}"
  
    v = Violation.new({
      code: code,
      demerits: demerits,
      description: description
    })
    v.id = id
    v.save
    pp v
  end
end
