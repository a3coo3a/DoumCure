package com.team3.docuweb.auth;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLogin {
	private OAuth20Service oauthService; 
	private String profileUrl;
	public NaverLogin(NaverValue n_sns) {
		this.oauthService = new ServiceBuilder(n_sns.getClientId())
					.apiSecret(n_sns.getClientSecret())
					.callback(n_sns.getRedirectUrl())
					.scope("profile")
					.build(n_sns.getApi20Instance());
		this.profileUrl = n_sns.getProfileUrl();
	}
	public String getNaverAuthURL() {
		System.out.println("getnaverAuthURL >> "+this.oauthService.getAuthorizationUrl());
		return this.oauthService.getAuthorizationUrl();
	}
	
	public String getUserProfile(String code) throws IOException, InterruptedException, ExecutionException {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.profileUrl);
		
		oauthService.signRequest(accessToken, request);
		Response response = oauthService.execute(request);
		
		return response.getBody();
	}
}
