require 'codegen/lib/markdown_parser'
require 'codegen/lib/component'
require 'codegen/lib/java/tld'

namespace :generate do

    namespace :java do

        task :tld do

            generator = CodeGen::Java::TLD::Generator.new('wrappers/java/kendo-taglib/src/main/resources/META-INF/taglib.tld')

            CodeGen::MarkdownParser.all.sort {|a, b| a.name <=> b.name}.each do |component|

                generator.component(component)

            end

            generator.sync

        end
    end

end
