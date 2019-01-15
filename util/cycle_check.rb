versions = {}
Dir['../*.lic'].each do |path|
    file = File.basename(path)
    body = File.open("../#{file}", 'r').readlines.join('')
    body =~ /custom_require.call\((.+)\)/i
    reqs = $1 || ""
    if reqs =~ /^\w/
        reqs = "['#{reqs}']"
    end
    name = file[0..-5]
    versions[name] = eval(reqs)
end

versions.keys.each do |file|
    v = {}
    todo = [versions[file]].flatten
    while curr = todo.pop
        if curr == file
            raise "Cycle in #{file}"
        end
        v[curr] = true
        if versions[curr]
            todo = (todo + versions[curr]).uniq - v.keys
        end
    end
end