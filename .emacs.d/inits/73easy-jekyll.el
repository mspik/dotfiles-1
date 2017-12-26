(setq easy-jekyll-basedir "~/src/github.com/masasam/PPAP2/")
(setq easy-jekyll-url "http://example.org")
(setq easy-jekyll-sshdomain "blogdomain")
(setq easy-jekyll-root "/home/jekyll/")
(setq easy-jekyll-previewtime "300")
(define-key global-map (kbd "C-c C-j") 'easy-jekyll)

(setq easy-jekyll-bloglist '(((easy-jekyll-basedir . "~/src/github.com/masasam/jekyll1/")
			      (easy-jekyll-url . "http://example1.com")
			      (easy-jekyll-sshdomain . "blogdomain")
			      (easy-jekyll-root . "/home/jekyll2"))
			     ((easy-jekyll-basedir . "~/src/github.com/masasam/jekyll2/")
			      (easy-jekyll-url . "http://example2.net"))))
