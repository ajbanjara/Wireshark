# Release Policy

## History

Until March 2008 life was simple. Wireshark was still in Beta development (as it had been for the last 10 years) and new beta versions popped up at an irregular, but usually short interval. These new releases were just like the the previous one, but with a series of patches applied. These came from willing volunteers, companies publishing their work and/or the group of core developers. This group helps the original author, Gerald Combs, to work on new features and handle the flow of incoming patches.

As 2008 arrived Gerald determined that Wireshark was reaching a point at which it was mature enough to be granted Stable status. This was the start of a slightly more complex life for Wireshark and its core developers.

### What is it?

A Release Policy defines the set of agreements made among the core developers in order to assure consistent release contents. What this means is that for the end user it must be predictable what it can find in a certain release of the software. This contents is defined by Gerald in cooperation with the core developers and the user community.

## The policy

### The Stable release

A Stable release is defined as a consistent set of source files, which, together with the indicated libraries, implement the then available functions and features. In March 2008 the first Stable branch of the source code was split off the main Development trunk. Of course this code, coming straight from the Development trunk, was not consistent nor bug free. Additional work was done to stabilize the code, so that after a few pre-releases the first Stable release, was made.

### The release life cycle

During the lifetime of this Stable release inevitably problems are found and bug fixes presented. These fixes are developed and tested in the Development trunk and then scheduled for back-porting to the Stable branch. When enough bug fixes are collected or the severity of the bugs warrant it and at the discretion of Gerald, a new Maintenance release on the Stable release branch is prepared. This Maintenance release has to *adhere to the same policy of consistent release contents, so does **not** contain new or changed features, but only repairs of detected flaws*. The only other changes allowed are updates of volatile data files, like the manufacturer database, enterprise numbers, etc.

When a new Stable release is split off from the Development trunk, the fate of the previous Stable release has to be decided on. It may either be Abandoned, in favor of the new Stable branch, or Retired, which means it will keep getting the attention it needs to keep working, but nothing more.

The current state of the release life cycle can be found here: [Development/LifeCycle](/Development/LifeCycle).

### Development snapshots

Besides Stable branches the Development trunk lives on, collecting bug fixes as well as new and changed features. All these committed changes spawn an automatic build in order to verify the consistency of the source code, as well as present power users the option to work with the bleeding edge of features.

Whenever feasible, Gerald may decide to publish a Development snapshot release in order to get more exposure of the features in development.

### Release numbers

The release numbers put on the software indicates what the status of the software is. This is explained here: [Development/ReleaseNumbers](/Development/ReleaseNumbers).

### Rationale

The intent of this policy is to give users stable software. Not just stable as in "it doesn't crash" but stable as in "the interfaces don't change." While such stability may not matter to people who only use the GUI, it is important to some users who, for example, automate testing of network products based on tshark's output. It also matters to many Linux distributions which have policies of not making (significant) software version upgrades during the (distro) version's lifetime--presumably for the same basic reason: to preserve interface stability. For example, Fedora's [Updates Policy](https://fedoraproject.org/wiki/Updates_Policy) for [Stable Releases](https://fedoraproject.org/wiki/Updates_Policy#Stable_Releases) says that only bug fixes should be made to a package once a stable release is made.

By maintaining stable branches, Wireshark's development team helps ensure that Linux users (at least those who get Wireshark from their distribution) are able to get important Wireshark bug fixes; if the stable branches weren't maintained as long as they are Linux distributions would likely apply only bug fixes (including security fixes) that were reported by their users (if they updated Wireshark at all). By maintaining the stable branches Wireshark's development team is able to control what bug fixes these users get while making the distributions' jobs easier.

This policy does have the side effect that new stable branches are not extremely common; recently a new branch has been created once a year around the time of the Sharkfest user and developer conference. For users for whom (interface) stability is not important but who wish to have new features sooner the development snapshots are likely the best answer.

### Roadmap

A rough planning of the dates and overview of content of the upcoming software releases is given here: [Development/Roadmap](/Development/Roadmap).

---

Imported from https://wiki.wireshark.org/Development/ReleasePolicy on 2020-08-11 23:13:03 UTC
