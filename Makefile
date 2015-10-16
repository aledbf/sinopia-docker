
ifndef TAG
	TAG = git-$(GIT_SHA)
endif

PREFIX = aledbf/sinopia

all: push

container:
	docker build -t $(PREFIX):$(TAG) .

push: container
	docker push $(PREFIX):$(TAG)

clean:
	docker rmi $(PREFIX):$(TAG)