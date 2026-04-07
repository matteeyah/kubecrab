# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

ActiveRecord::Migration.say_with_time("Creating engines...") do
  Engine.find_or_create_by(
    name: "kubernetes",
    deploy_command: "kubectl apply -f %TEMPLATE%",
    status_command: "kubectl -n %NAMESPACE% get pod -l app=%NAME%",
    update_command: "kubectl apply -f %TEMPLATE%",
    restart_command: "kubectl -n %NAMESPACE% rollout restart deployment %NAME%",
    destroy_command: "kubectl delete -f %TEMPLATE%"
  )
end
