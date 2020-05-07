class GossipsController < ApplicationController


  def index
  	@gossip = Gossip.last(10)
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
  	@gossip = Gossip.find(params[:id])

    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create

	puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts "$" * 60

    title = params["gossip_title"]
    content = params["gossip_text"]
  	@gossip = Gossip.new() # avec xxx qui sont les données obtenues à partir du formulaire
  	@gossip.title = title
  	@gossip.content = content
  	@gossip.user_id = 1

  	if @gossip.save # essaie de sauvegarder en base @gossip
  		redirect_to action: "index"
    	# si ça marche, il redirige vers la page d'index du site
  	else
  		render "new"
    	# sinon, il render la view new (qui est celle sur laquelle on est déjà)
  	end


    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
  	@gossip = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end


  def update

	puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts "$" * 60

  	@gossip = Gossip.find(params[:id])

  	if @gossip.update_attributes(:title => params[:gossip][:title], :content => params[:gossip][:content]) # essaie de sauvegarder en base @gossip
  		redirect_to action: "show"
    	# si ça marche, il redirige vers la page d'index du site
  	else
  		render "edit"
    	# sinon, il render la view new (qui est celle sur laquelle on est déjà)
  	end
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  	@gossip = Gossip.find(params[:id])
    if @gossip.delete   
  		redirect_to action: "index"
    else   
  		redirect_to action: "show"
    end   

  end

end
