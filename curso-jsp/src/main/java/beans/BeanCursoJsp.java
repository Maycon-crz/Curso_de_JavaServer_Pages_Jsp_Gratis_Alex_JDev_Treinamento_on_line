package beans;

public class BeanCursoJsp {
	
	private String login;
	
	private String senha;
	
	public boolean validarLoginSenha(String login, String senha) {
		if(login.equalsIgnoreCase("admin") && senha.equalsIgnoreCase("admin")) {
			return true;
		}else {
			return false;
		}
	}
			
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}



	public String getSenha() {
		return senha;
	}



	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	//-----------//-----------//-----------//-----------
	private String nome;
	
	private String ano;
	
	private String sexo;
	
	
	
	public String getNome() {
		return nome;
	}



	public void setNome(String nome) {
		this.nome = nome;
	}



	public String getAno() {
		return ano;
	}



	public void setAno(String ano) {
		this.ano = ano;
	}



	public String getSexo() {
		return sexo;
	}



	public void setSexo(String sexo) {
		this.sexo = sexo;
	}



	public int calcula(int numero) {
		return numero * 100;
	}
}
