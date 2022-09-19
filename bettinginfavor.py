import matlab.engine

eng = matlab.engine.start_matlab()

eng.FavorableOdds(nargout=0)

eng.quit()
