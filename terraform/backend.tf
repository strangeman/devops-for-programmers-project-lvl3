terraform {
  cloud {
    organization = "hexlet-devops-2"

    workspaces {
      name = "devops-for-programmers-project-lvl3"
    }
  }
}
