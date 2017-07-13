package br.ifpe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import br.ifpe.basicas.Perfil;
import br.ifpe.basicas.Usuario;
import br.ifpe.util.ConnectionFactory;

public class UsuarioDao {

	private Connection connection;

	public UsuarioDao() {
			try {
				this.connection = (Connection) new ConnectionFactory().getConnection();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	
		//iserir
	public void inserir(Usuario usuario) throws UsuarioRepetidoException {
		try {
			String sql = "INSERT INTO usuario(nome, matricula, perfil) VALUES (?,?,?)";
			PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getMatricula());
			stmt.setString(3, usuario.getPerfil().toString());
			

			stmt.execute();
			connection.close();

		
		
		
		
		
		}catch(SQLIntegrityConstraintViolationException e){
				  // esta exceção é esclusiva para violação de chave unica
				throw new UsuarioRepetidoException(e);

				}
		
		catch (SQLException e) {			
			throw new RuntimeException(e);
		}
	
	}

	private Usuario montarObjeto(ResultSet rs) throws SQLException {

		Usuario usuario = new Usuario();
		
		usuario.setId(rs.getInt("id"));
		usuario.setNome(rs.getString("nome"));
		usuario.setMatricula(rs.getString("matricula"));
		usuario.setPerfil(Perfil.valueOf(rs.getString("perfil")));

		return usuario;
	}

	// listar usuario
		public List<Usuario> listar() {

			try {
				
				List<Usuario> listarUsuario = new ArrayList<Usuario>();
				String sql = "SELECT * FROM usuario ORDER BY nome";
				PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
			
				ResultSet rs = stmt.executeQuery();

				while (rs.next()) {
					listarUsuario.add(montarObjeto(rs));
				}

				rs.close();
				stmt.close();
				connection.close();

				return listarUsuario;

			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		
		public void remover(Usuario usuario) {

			try {
				String sql = "DELETE FROM usuario WHERE id = ?";
				PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
			   
			    stmt.setInt(1, usuario.getId());
			   
			    stmt.execute();
			    stmt.close();
			    connection.close();
			} catch (SQLException e) {
			    throw new RuntimeException(e);
			}
		
		}

}//fim
