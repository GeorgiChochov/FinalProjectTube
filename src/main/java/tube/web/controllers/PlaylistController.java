package tube.web.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tube.entities.Playlist;
import tube.persistence.PlaylistDAO;
import tube.persistence.UserDAO;
import tube.security.SecurityUser;

@Controller
public class PlaylistController {

	@Autowired
	private PlaylistDAO playlistDao;
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(value = "/playlist/{playlistId}", method = GET)
	public String getPlaylist(@PathVariable(value="playlistId") int playlistId, Model model) {
		Playlist playlist = playlistDao.findOne(playlistId);
		model.addAttribute("playlist", playlist);
		return "playlist";
	}
	
	@RequestMapping(value = "/playlists/{username}", method = GET)
	public String getPlaylists(@PathVariable(value="username") String username, Model model) {
		System.out.println(username);
		List<Playlist> playlists = userDao.findByUsername(username).getPlaylists();
		for (Playlist playlist : playlists) {
			System.out.println(playlist.getName());			
		}
		model.addAttribute("user", userDao.findByUsername(username));
		return "userPlaylists";
	}
	
	@RequestMapping(value = "/video/addToPlaylist", method = POST)
	public @ResponseBody String addVideoToPlaylist(@RequestParam("add") boolean addStatus, @RequestParam("playlistId") int playlistId) {
		if (addStatus) {
			//add video to playlist
			//return "Remove"
		} else {
			//remove video from playlist
			//return "Add"
		}
		return null;
	}
	
	@RequestMapping(value = "/video/getPlaylists", method = POST)
	public @ResponseBody String getAddablePlaylists() {
		System.err.println("hi");
		SecurityUser user = (SecurityUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Playlist> playlists = playlistDao.findByUserId(user.getId());
		System.out.println(playlists.toString());
		return "hello";
	}
	
}