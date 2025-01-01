## rake populate_data:task
#Low Priority
#"CI/CD pipelines for running tests"
#"CI/CD with Jenkins"
#"Nginx"
#"React Native"
#"Azure Cloud"
#"CI/CD with Gitlab"
#"Node js"
#"Chatgpt + AI + Gen AI + AI agent"
#"Automation Testing(Java/ruby + selenium)"
namespace :populate_data do
  desc "Dummy data"
  task :task => :environment do
    puts "==============Task creation start=========================="

    Task.create!(name: "Angular", description: "Angular", official_documentation: "https://angular.dev/overview", video_link: "https://www.udemy.com/course/the-complete-guide-to-angular-2/learn/lecture/13914134?start=0#overview" )

    Task.create!(name: "Docker + Kubernates + ArgoCD", description: "Docker + Kubernates + ArgoCD", official_documentation: "https://docs.docker.com/", video_link: "https://www.udemy.com/course/docker-mastery/learn/lecture/6775794?start=0#overview")

    Task.create!(name: "Aws", description: "Aws", official_documentation: "https://aws.amazon.com/getting-started/hands-on/?getting-started-all.sort-by=item.additionalFields.content-latest-publish-date&getting-started-all.sort-order=desc&awsf.getting-started-category=category%23databases&awsm.page-getting-started-all=1", video_link: "https://www.udemy.com/course/draft/362328/learn/lecture/13886254?start=0#overview")

    Task.create!(name: "Microservices", description: "Microservices", official_documentation: "https://microservices.io/", video_link: "https://www.udemy.com/course/microservices-with-node-js-and-react/learn/lecture/19099022?start=0#overview")

    Task.create!(name: "React + test", description: "React + test", official_documentation: "https://react.dev/learn", video_link: "https://www.udemy.com/course/the-ultimate-react-course/learn/lecture/37350500?start=0#overview")

    Task.create!(name: "Design Pattern", description: "Design Pattern + Solid Principal + Algorithms", official_documentation: "https://refactoring.guru/design-patterns/ruby", video_link: "")

    Task.create!(name: "Linux", description: "Linux", official_documentation: "https://www.javatpoint.com/linux-tutorial", video_link: "https://www.udemy.com/course/complete-linux-training-course-to-get-your-dream-it-job/learn/lecture/20147642?start=0#overview")

    Task.create!(name: "Java", description: "Java", official_documentation: "https://www.w3schools.com/java/java_ref_reference.asp", video_link: "https://www.udemy.com/course/java-the-complete-java-developer-course/learn/lecture/34998306?start=0#overview")

    Task.create!(name: "EJB / Spring boot  + Test Cases", description: "EJB / Spring boot  + Test Cases", official_documentation: "https://www.tutorialspoint.com/ejb/index.htm", video_link: "https://www.tutorialspoint.com/ejb/ejb_access_database.htm")

    Task.create!(name: "GCP", description: "GCP", official_documentation: "https://cloud.google.com/docs/enterprise/setup-checklist", video_link: "https://www.udemy.com/course/google-cloud-professional-cloud-architect-certification/learn/lecture/26121442?start=0#overview")

    Task.create!(name: "Jira Project Management", description: "Jira Project Management", official_documentation: "", video_link: "https://www.udemy.com/course/the-complete-guide-to-jira-with-real-world-examples/learn/lecture/6725112?start=0#overview")

    Task.create!(name: "Excel", description: "Excel", official_documentation: "https://www.w3schools.com/excel/", video_link: "https://www.udemy.com/course/useful-excel-for-beginners/learn/lecture/720152?start=0#overview")

    Task.create!(name: "Mongo DB", description: "Mongo DB", official_documentation: "https://www.mongodb.com/docs/manual/tutorial/getting-started/", video_link: "https://www.w3schools.com/mongodb/")

    Task.create!(name: "Html + CSS + BootStrap", description: "Html + CSS + BootStrap", official_documentation: "https://getbootstrap.com/docs/5.3/forms/overview/", video_link: "https://www.udemy.com/course/design-and-develop-a-killer-website-with-html5-and-css3/learn/lecture/27511920?start=0#overview")
    
    Task.create!(name: "Javascript", description: "Javascript", official_documentation: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Event_loop", video_link: "https://www.udemy.com/course/the-complete-javascript-course/learn/lecture/22648141?start=0#overview")

    Task.create!(name: "TypeScript", description: "TypeScript", official_documentation: "https://www.typescriptlang.org/docs/handbook/typescript-from-scratch.html", video_link: "")

    Task.create!(name: "Store Procedure & Sql Advance + Database Engineering", description: "Store Procedure & Sql Advance + Database Engineering", official_documentation: "https://www.tutorialspoint.com/sql/sql-stored-procedures.htm", video_link: "https://www.udemy.com/course/microsoft-sql-for-beginners-sql-server-and-t-sql/learn/lecture/19088386#overview")

    Task.create!(name: "Maths", description: "Maths", official_documentation: "", video_link: "")

    Task.create!(name: "Rails 7 + Ruby 3 + Rspec + Meta Programming", description: "Rails 7 + Ruby 3 + Rspec + Meta Programming", official_documentation: "https://www.udemy.com/course/ruby-metaprogramming/learn/lecture/2612476?start=0#overview", video_link: "https://www.udemy.com/course/ruby-rails-5-bdd-rspec-capybara/learn/lecture/5945800?start=0#overview")

    Task.create!(name: "Figma for Webdesign + webflow", description: "Figma for Webdesign + webflow", official_documentation: "", video_link: "https://www.udemy.com/course/figma-ux-ui-design-user-experience-tutorial-course/learn/lecture/29164044?start=0#overview")

    Task.create!(name: "Loading Testing (Jmeter)", description: "Loading Testing (Jmeter)", official_documentation: "", video_link: "https://www.udemy.com/course/master-jmeter-from-basics-performance-load-api-testing/learn/lecture/8126208?start=0#overview")

    Task.create!(name: "Others", description: "Other Tasks", official_documentation: "", video_link: "")

    Task.create!(name: "In-house project development", description: "In-house project development", official_documentation: "", video_link: "")
    Task.create!(name: "AI", description: "AI Co-pilot by Microsoft", official_documentation: "https://github.com/features/copilot", video_link: "")
    puts "==============Task creation Completed=========================="
  end
end